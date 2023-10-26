#!/bin/bash

function get_group_id {
    unset GROUP_ID
    GROUP_ID=$(./kcadm.sh get groups -r master -q search=$1 | grep -oP '(?<="id" : ")[^"]*')
}

function create_group {
    ./kcadm.sh create groups -r master -s name=$1
    get_group_id $1
}

function get_role_id {
    unset ROLE_ID
    ROLE_ID=$(./kcadm.sh get roles/$1 -r master --fields id | grep -oP '(?<="id" : ")[^"]*')
}

function create_role {
    ./kcadm.sh create roles -r master -s name=$1 -s "description=$2"
    get_role_id $1
}

function add_role_to_group {
    echo ./kcadm.sh add-roles -r master --gid $1 --rolename $2
    ./kcadm.sh add-roles -r master --gid $1 --rolename $2
}

(printf "%s" "waiting for Keycloak…"
while ! (echo > /dev/tcp/localhost/80) &> /dev/null
do
    printf "%c" "."
    sleep 2
done
cd /opt/keycloak/bin
./kcadm.sh config credentials --user admin --password admin --server http://localhost/ --realm master
USER_ID=$(./kcadm.sh get users -r master --limit 1 --fields id | grep -oP '(?<="id" : ")[^"]*')
./kcadm.sh create clients \
    -s clientId=invitease \
    -s 'redirectUris=["http://app.localhost/*","http://dbadmin.localhost/*"]' \
    -s clientAuthenticatorType=client-secret -s serviceAccountsEnabled=true \
    -s directAccessGrantsEnabled=true \
    -s secret=d0b8122f-8dfb-46b7-b68a-f5cc4e25d000 
CLIENT_ID=$(./kcadm.sh get clients -r master -q clientId=invitease --fields id | grep -oP '(?<="id" : ")[^"]*')
./kcadm.sh create groups -r master -s name=admin
get_group_id admin
./kcadm.sh update users/$USER_ID/groups/$GROUP_ID -r master -s realm=master -s userId=$USER_ID -s groupId=$GROUP_ID -n
add_role_to_group $GROUP_ID admin
./kcadm.sh create clients/$CLIENT_ID/protocol-mappers/models -r master \
    -s name=groups \
    -s protocol=openid-connect \
    -s protocolMapper=oidc-usermodel-realm-role-mapper \
    -s 'config."userinfo.token.claim"=true' \
    -s 'config."id.token.claim"=true' \
    -s 'config."claim.name"=roles'  \
    -s 'config."access.token.claim"=true' \
    -s 'config."jsonType.label"=String' \
    -s 'config."multivalued"=true'
create_group guards
create_role guard "Guards that are allowed to admit guests."
echo GROUP_ID: $GROUP_ID
add_role_to_group $GROUP_ID "guard"
create_role user "Regular user with a limited set of permissions"
create_group users
add_role_to_group $GROUP_ID "user"
./kcadm.sh update realms/master -s attributes.frontendUrl=http://keycloak.localhost/) &
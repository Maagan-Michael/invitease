#!/bin/bash
(printf "%s" "waiting for Keycloak…"
while ! (echo > /dev/tcp/localhost/9990) &> /dev/null
do
    printf "%c" "."
    sleep 2
done
cd /opt/jboss/keycloak/bin
./kcadm.sh config credentials --user admin --password admin --server http://localhost:8080/auth --realm master
USER_ID=$(./kcadm.sh get users -r master --limit 1 --fields id | grep -oP '(?<="id" : ")[^"]*')
./kcadm.sh create clients \
    -s clientId=invitease \
    -s 'redirectUris=["http://backend.localhost/*"]' \
    -s clientAuthenticatorType=client-secret -s serviceAccountsEnabled=true \
    -s directAccessGrantsEnabled=true \
    -s secret=d0b8122f-8dfb-46b7-b68a-f5cc4e25d000 
CLIENT_ID=$(./kcadm.sh get clients -r master -q clientId=invitease --fields id | grep -oP '(?<="id" : ")[^"]*')
./kcadm.sh create groups -r master -s name=admin
GROUP_ID=$(./kcadm.sh get groups -r master -q name=admin | grep -oP '(?<="id" : ")[^"]*')
./kcadm.sh update users/$USER_ID/groups/$GROUP_ID -r master -s realm=master -s userId=$USER_ID -s groupId=$GROUP_ID -n
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
./kcadm.sh create groups -r master -s name=guards
./kcadm.sh create groups -r master -s name=users    
./kcadm.sh update realms/master -s attributes.frontendUrl=http://keycloak.localhost/auth) &
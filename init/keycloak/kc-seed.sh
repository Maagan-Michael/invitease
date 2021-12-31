#!/bin/bash
(printf "%s" "waiting for Keycloak…"
while ! (echo > /dev/tcp/localhost/9990) &> /dev/null
do
    printf "%c" "."
    sleep 2
done
cd /opt/jboss/keycloak/bin
./kcadm.sh config credentials --user admin --password admin --server http://localhost:8080/auth --realm master
./kcadm.sh create clients -s clientId=invitease -s 'redirectUris=["http://invitease.localhost/*"]' -s clientAuthenticatorType=client-secret -s secret=d0b8122f-8dfb-46b7-b68a-f5cc4e25d000
./kcadm.sh update realms/master -s attributes.frontendUrl=http://keycloak.localhost/auth) &
SET DOCKER_COMPOSE=docker compose -f ..\docker-compose.yml
%DOCKER_COMPOSE% cp .\key-cloak-seed.sh keycloak:/key-cloak-seed.sh 
%DOCKER_COMPOSE% exec -u root keycloak sh /key-cloak-seed.sh 
%DOCKER_COMPOSE% exec -u root keycloak rm /key-cloak-seed.sh 

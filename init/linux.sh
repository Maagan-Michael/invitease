#!/bin/bash
DOCKER_COMPOSE="docker compose -f ../docker-compose.yml"
eval "$DOCKER_COMPOSE cp ./key-cloak-seed.sh keycloak:/key-cloak-seed.sh"
eval "$DOCKER_COMPOSE exec -u root keycloak sh /key-cloak-seed.sh"
eval "$DOCKER_COMPOSE exec -u root keycloak rm /key-cloak-seed.sh"

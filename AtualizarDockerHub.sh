#!/bin/bash

##########################################################
##                        ATENÇÃO                       ##
##########################################################
##  SOMENTE USAR ESSE SCRIPT AO DESENVOLVER, DEPOIS DE  ##
##  CONVERSAR COM O ADMIM DO REPOSITORIO NO DOCKER HUB  ##
##########################################################

# CARREGAR AS VARIAVEIS DO .env
set -o allexport
source .env
set +o allexport

# LOGIN NO DOCKER HUB
echo "$DOCKER_HUB_PASSWORD" | docker login --username "$DOCKER_HUB_USERNAME" --password-stdin

# CONSTROI O NOME COMPLETO DA IMAGEM
NOME_IMAGEM_COMPLETO="${DOCKER_HUB_USERNAME}/${DOCKER_HUB_IMAGE_NAME}:${DOCKER_HUB_TAG}"

# BUILDA A IMAGEM SE BASEANDO NO NOME COMPLETO E NO CAMINHO DO DOCKERFILE
docker build -t "$NOME_IMAGEM_COMPLETO" -f "$DOCKERFILE_PATH" .

docker push "$NOME_IMAGEM_COMPLETO"

docker logout



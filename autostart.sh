#!/bin/sh

CONTAINER_NAME=ollama
LLM_MODEL=deepseek-r1
LLM_SIZE=14b

docker run \
    --name ${CONTAINER_NAME} \
    -d \
    -it \
    --rm \
    --gpus=all \
    -p 11434:11434 \
    -p 8080:8080 \
    ${CONTAINER_NAME}:${LLM_MODEL}

echo "Container is up and running in background!"
echo "CTRL+D to exit"

docker exec -it ${CONTAINER_NAME} ollama run ${LLM_MODEL}:${LLM_SIZE}-system-prompt

docker stop ${CONTAINER_NAME}

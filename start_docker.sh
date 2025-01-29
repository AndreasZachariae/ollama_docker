#!/bin/sh

CONTAINER_NAME=ollama
LLM_MODEL=deepseek-r1

docker run \
    --name ${CONTAINER_NAME} \
    -it \
    --rm \
    --gpus=all \
    -p 11434:11434 \
    ${CONTAINER_NAME}:${LLM_MODEL} \
    /bin/bash

    # -v ollama:/root/.ollama \
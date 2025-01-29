#!/bin/sh

CONTAINER_NAME=ollama
LLM_MODEL=deepseek-r1
LLM_SIZE=14b

docker build \
    --build-arg LLM_MODEL=${LLM_MODEL}:${LLM_SIZE} \
    -t ${CONTAINER_NAME}:${LLM_MODEL} \
    .

    # --no-cache \
    # --progress plain \
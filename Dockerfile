##############################################################################
##                                 Base Image                               ##
##############################################################################
# Ubuntu 22.04. Jammy
FROM ollama/ollama:latest
ARG LLM_MODEL

##############################################################################
##                                 Global Dependecies                       ##
##############################################################################
# Install open-webui
RUN apt-get update && apt-get install --no-install-recommends -y \
    iputils-ping nano htop git sudo wget curl \
    python3-pip \
    python3.11 \
    python3.11-venv \
    && rm -rf /var/lib/apt/lists/*

RUN python3.11 -m venv /venv
RUN . /venv/bin/activate && pip install open-webui

##############################################################################
##                                 Autostart                                ##
##############################################################################
RUN ollama serve & sleep 5 && \
    ollama pull ${LLM_MODEL} && \
    pkill ollama

COPY ./Modelfile /Modelfile

RUN ollama serve & sleep 5 && \
    ollama create ${LLM_MODEL}-system-prompt -f /Modelfile && \
    pkill ollama

# Configure open-webui
ENV WEBUI_AUTH=False
# ENV OFFLINE_MODE=True

# Entrypoint set in base image
# ENTRYPOINT [ "/bin/ollama" ]
ENTRYPOINT [ "" ]
CMD [ "ollama", "serve" ]

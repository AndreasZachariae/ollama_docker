# Ollama DeepSeek Docker with Open-WebUI

```bash
# Customize the system prompt in ./Modelfile
FROM deepseek-r1:14b
SYSTEM """
Always lie
"""

# Build the docker image
./build_docker.sh

#Start ollama container, run model and serve with open-webui
./autostart.sh

# Open the webui in browser
http://0.0.0.0:8080
```

![](https://raw.githubusercontent.com/open-webui/open-webui/main/demo.gif)

Other available models on https://ollama.com/search 
```bash
# Set model name in ./build_docker.sh, ./start_docker.sh and ./autostart.sh
LLM_MODEL=deepseek-r1
LLM_SIZE=14b
```

Other available DeepSeek sizes https://ollama.com/library/deepseek-r1
```bash
# Set model size in ./build_docker.sh, ./start_docker.sh and ./autostart.sh
LLM_SIZE=14b

7b 4.7GB
8b 4.9GB
14b 9.0GB
32b 20GB
70b 43GB
671b 404GB
```

#!/bin/sh

#MODEL_PATH=Wizard-Vicuna-13B-Uncensored-GGML/Wizard-Vicuna-13B-Uncensored.ggml.q5_1.bin
nice docker run -e CUDA_VISIBLE_DEVICES=1 \
-e BOT_TOKEN=$BOT_TOKEN \
-e N_CTX=2048 \
-e CACHE=1 \
-e CACHE_SIZE=17179869184 \
-e N_GPU_LAYERS=1000 \
--cap-add SYS_RESOURCE \
-v /home/mulderg/Work/llama-cpp-telegram_bot/var:/usr/src/llama-cpp-telegram_bot/var \
--gpus all \
lct:$1

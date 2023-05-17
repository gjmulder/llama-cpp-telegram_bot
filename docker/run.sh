#!/bin/sh

#nice docker run -e CUDA_VISIBLE_DEVICES=1 \
docker run \
-e BOT_TOKEN=$BOT_TOKEN \
-e N_CTX=2048 \
-e CACHE=1 \
-e CACHE_SIZE=17179869184 \
--cap-add SYS_RESOURCE \
-v /home/mulderg/Work/llama-cpp-telegram_bot/var:/usr/src/llama-cpp-telegram_bot/var \
--gpus all \
lct:olivia

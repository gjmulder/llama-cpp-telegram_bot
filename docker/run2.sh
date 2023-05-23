#!/bin/sh

if [ $# -ne 1 ]
then
    echo "Usage: $0 <docker image tag>"
    exit
fi

# BOT_TOKEN needs to be set to the token Telegram's BotFather gives you for your bot
# and exported before this script is run. Do not save the TOKEN to a file for security
# reasons.

# Change LOCAL_PATH to point to the install of llama-cpp-telegram_bot
# Copy the model to $LOCAL_PATH/llama-cpp-telegram_bot/var/models/model.bin
# the -v option below maps $LOCAL_PATH/llama-cpp-telegram_bot/var into the Docker image
# so that the config is stateful and can be edited while the container is running.

LOCAL_PATH=/home/mulderg/Work

nice docker run \
-e CUDA_VISIBLE_DEVICES=1 \
-e BOT_TOKEN=$BOT_TOKEN2 \
--cap-add SYS_RESOURCE \
-v $LOCAL_PATH/llama-cpp-telegram_bot/var2:/usr/src/llama-cpp-telegram_bot/var \
--gpus all \
$1


#!/bin/bash

export NCCL_DEBUG=INFO
export NCCL_IB_DISABLE=0
export NCCL_SOCKET_IFNAME=bond0
export GLOO_SOCKET_IFNAME=bond0

model="/data/DeepSeek-V3.1-Terminus"
modelname="DeepSeek-V3.1-Terminus"

python -m vllm.entrypoints.openai.api_server --api-key test1234 --model $model --served-model-name $modelname --enable-auto-tool-choice --chat-template /data/chat-template/deepseek-v31.jinja --tool-call-parser deepseek_v31 --trust-remote-code --tensor-parallel-size 8 --max-model-len 163840 --port 8000


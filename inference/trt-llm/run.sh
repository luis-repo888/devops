#!/bin/bash

export NCCL_DEBUG=INFO
export NCCL_IB_DISABLE=0
export NCCL_SOCKET_IFNAME=bond0
export GLOO_SOCKET_IFNAME=bond0


model="/data/DeepSeek-V3.2"
trtllm-serve $model  \
        --host '0.0.0.0' --port 30001 --backend pytorch --tp_size 8 \
        --ep_size 8 --pp_size 1  --max_seq_len 8192 --max_num_tokens 8192 --max_batch_size 64 \
        --extra_llm_api_options  /data/B300/deepseek-v32.yml --tool_parser deepseek_v32 \
        --chat_template /data/sglang/examples/chat_template/tool_chat_template_deepseekv32.jinja

# muli nodes

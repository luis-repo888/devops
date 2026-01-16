#!/bin/bash

export NCCL_DEBUG=INFO
export NCCL_IB_DISABLE=0
export NCCL_SOCKET_IFNAME=bond0
export GLOO_SOCKET_IFNAME=bond0

python -m sglang.launch_server --model-path /data/DeepSeek-V3.1-Terminus --tokenizer-path /data/DeepSeek-V3.1-Terminus --chat-template /data/sglang/examples/chat_template/tool_chat_template_deepseekv31.jinja --tool-call-parser deepseekv31 --host 0.0.0.0 --port 30000 --tp-size 8 

# muli nodes

#python -m sglang.launch_server --model-path /data/DeepSeek-V3.1-Terminus --tokenizer-path /data/DeepSeek-V3.1-Terminus --chat-template /data/sglang/examples/chat_template/tool_chat_template_deepseekv31.jinja --tool-call-parser deepseekv31 --host 0.0.0.0 --port 30000 --tp-size 8 --nnodes 2 --node-rank 0 --dist-init-addr 172.21.16.10:25000

#python -m sglang.launch_server --model-path /data/DeepSeek-V3.1-Terminus --tokenizer-path /data/DeepSeek-V3.1-Terminus --chat-template /data/sglang/examples/chat_template/tool_chat_template_deepseekv31.jinja --tool-call-parser deepseekv31 --host 0.0.0.0 --port 30000 --tp-size 8 --nnodes 2 --node-rank 1 --dist-init-addr 172.21.16.10:25000



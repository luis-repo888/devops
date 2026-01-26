#!/bin/bash


docker run --gpus all --privileged --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -it -v /data:/data --network host --device=/dev/infiniband:/dev/infiniband --security-opt=seccomp=unconfined -e -e UCX_TLS=tcp --rm nvcr.io/nvidia/tensorrt-llm/release:1.3.0rc0

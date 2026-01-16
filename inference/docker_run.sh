#!/bin/bash


docker run --gpus all --privileged --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -it -v /data:/data --network host -v /dev/infiniband:/dev/infiniband --security-opt=seccomp=unconfined  --rm nvcr.io/nvidia/sglang:25.12-py3

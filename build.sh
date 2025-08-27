#!/bin/bash

# Building docker images

docker build -t aw-gpu -f Dockerfile_gpu .
docker build -t aw-cpu -f Dockerfile_cpu .
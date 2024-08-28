# Segment Anything 2 - Dockerized Version

This repository provides a Dockerized setup for Meta's Segment Anything 2 Model, including CUDA 12.1, Python 3.10, and Jupyter Lab.

## Features

- CUDA 12.1.0 with cuDNN 8
- Python 3.10 with necessary libraries for deep learning and data science
- Jupyter Lab for interactive development
- Pre-installed common libraries: `numpy`, `pandas`, `scikit-learn`, `tensorflow`, `torch`, `matplotlib`, `seaborn`, `requests`, and `dvc`

## Getting Started

### Prerequisites

- Docker installed on your system
- NVIDIA GPU with CUDA support (if using GPU)

### Build the Docker Image

```bash
docker build -t segment-anything-docker .

bash run.sh

docker exec -it segment-anything-container /bin/bash
nohup jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root &



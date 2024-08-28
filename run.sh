docker run -d --name segment-anything-container \
    -p 8888:8888 \
    --gpus all \
    -v /path/to/your/data:/workspace \
    segment-anything-docker
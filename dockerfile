# Use an Ubuntu 22.04 base image with CUDA 12.1 and cuDNN 8
FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04

# Set environment variables for non-interactive setup and timezone
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Install tzdata package and set the timezone
RUN apt-get update && apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Install Python 3.10, development tools, and necessary libraries
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libgdbm-dev \
    libbz2-dev \
    libexpat1-dev \
    liblzma-dev \
    tk-dev \
    libffi-dev \
    libnss3-dev \
    libedit-dev \
    python3.10 \
    python3.10-dev \
    python3.10-venv \
    libatlas-base-dev \
    libopenblas-dev \
    liblapack-dev

# Ensure pip is installed for Python 3.10
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.10 get-pip.py

# Set Python 3.10 as the default python3
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Upgrade pip and install additional Python dependencies
RUN python3.10 -m pip install --upgrade pip setuptools wheel

# Install common Python libraries, DVC, and Jupyter Lab
RUN python3.10 -m pip install \
    numpy==1.21.0 \
    pandas==1.3.0 \
    scikit-learn==0.24.2 \
    tensorflow==2.5.0 \
    torch==1.9.0 \
    matplotlib==3.4.2 \
    seaborn==0.11.1 \
    requests==2.25.1 \
    dvc==2.8.3 \
    jupyterlab

# Set the working directory
WORKDIR /workspace

# Expose the Jupyter Lab port
EXPOSE 8888

# Set the entry point for the container
CMD ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
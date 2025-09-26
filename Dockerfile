# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Set working directory
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip setuptools wheel

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python packages
RUN pip install -r requirements.txt

# Create a non-root user for security
RUN groupadd --gid 1000 vscode \
    && useradd --uid 1000 --gid vscode --shell /bin/bash --create-home vscode

# Set up Jupyter configuration
RUN mkdir -p /home/vscode/.jupyter && \
    echo "c.NotebookApp.ip = '0.0.0.0'" >> /home/vscode/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.port = 8888" >> /home/vscode/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.open_browser = False" >> /home/vscode/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.allow_root = True" >> /home/vscode/.jupyter/jupyter_notebook_config.py && \
    chown -R vscode:vscode /home/vscode/.jupyter

# Switch to non-root user
USER vscode

# Set the default working directory
WORKDIR /workspace

# Expose port for Jupyter
EXPOSE 8888

# Default command
CMD ["/bin/bash"]
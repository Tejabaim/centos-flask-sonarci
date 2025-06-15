FROM ubuntu:20.04

# Set environment to avoid prompts (like timezone or tzdata) during install
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt update && apt install -y python3 python3-pip && \
    pip3 install --upgrade pip

# Set working directory
WORKDIR /app

# Copy dependency file and install Python packages
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Copy all source code
COPY . .

# Default command to run app
CMD ["python3", "app.py"]


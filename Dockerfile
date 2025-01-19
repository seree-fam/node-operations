FROM rust:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    libclang-dev \
    pkg-config

# Clone and build reth
RUN git clone https://github.com/paradigmxyz/reth && \
    cd reth && \
    cargo build --release


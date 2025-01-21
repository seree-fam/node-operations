FROM rust:latest

# Install dependencies including lz4 for archive extraction
RUN apt-get update && \
    apt-get install -y \
    libclang-dev \
    pkg-config \
    curl \
    lz4

# Clone and build reth
RUN git clone https://github.com/paradigmxyz/reth && \
    cd reth && \
    cargo build --release


COPY start.sh /start.sh
RUN chmod +x /start.sh
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

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
CMD ["/entrypoint.sh"]
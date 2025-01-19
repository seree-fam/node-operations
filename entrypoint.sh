#!/bin/sh

# Check if jwt.hex exists, generate if not
if [ ! -f /jwt.hex ]; then
  echo "Generating jwt.hex..."
  head -c 32 /dev/urandom | hexdump -ve '1/1 "%.2x"' > /jwt.hex
  echo "jwt.hex generated."
else
  echo "Using existing jwt.hex."
fi

# Start the reth node
exec ./reth/target/release/reth node \
  --chain sepolia \
  --datadir /data \
  --http \
  --http.addr 0.0.0.0 \
  --http.port 8545 \
  --ws \
  --ws.addr 0.0.0.0 \
  --ws.port 8546 \
  --metrics 0.0.0.0:9001 \
  --authrpc.jwtsecret /jwt.hex \
  --authrpc.addr 0.0.0.0 \
  --authrpc.port 8551

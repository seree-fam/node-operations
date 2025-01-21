#!/bin/bash

# Check if data directory is empty
if [ ! "$(ls -A /data)" ]; then
    echo "Downloading snapshot..."
    wget -q -O - https://snapshots.publicnode.com/ethereum-sepolia-reth-archive-7319545.tar.lz4 | lz4 -d | tar -x -C /data
fi

# Start reth node
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
    --authrpc.port 8551 \
    --port 30303 \
    --discovery.port 30303 \
    --bootnodes "enode://92de31edbf700c1ab49065d08fdb7987d5f401798acf10d3b6f929d124106be4426a625fbfa235808b9a61cde8c19b1f8e79ad45adbea0ed57aabf34fce7d588@146.190.13.128:30303,enode://4bd5fa06258212174dec6763e2c307b234c5fca1fe0ab0a8b3e8be5ee825
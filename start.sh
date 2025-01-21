#!/bin/bash

# Check if data directory is empty
if [ ! "$(ls -A /data)" ]; then
    echo "Downloading snapshot..."
    curl -L https://snapshots.publicnode.com/ethereum-sepolia-reth-archive-7319545.tar.lz4 | lz4 -d | tar -x -C /data
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
    --bootnodes "enode://92de31edbf700c1ab49065d08fdb7987d5f401798acf10d3b6f929d124106be4426a625fbfa235808b9a61cde8c19b1f8e79ad45adbea0ed57aabf34fce7d588@146.190.13.128:30303,enode://4bd5fa06258212174dec6763e2c307b234c5fca1fe0ab0a8b3e8be5ee825aa22ad0294a49bcfe6c2040eae58084604e937f5b8689314f74f6d29d8920847eee1@146.190.1.103:30303,enode://75ac8f200bb4a111b658857236e0ac5060363d2f91542aabc82b26bf18a4788c86112eeae1cab2838ee4741884daf234c242d7c0e2dbbf706309c3cc3f88ca7d@77.31.232.88:30303"
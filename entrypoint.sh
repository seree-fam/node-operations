#!/bin/sh

# Check if jwt.hex exists, generate if not
if [ ! -f /jwt.hex ]; then
  echo "Generating jwt.hex..."
  head -c 32 /dev/urandom | hexdump -ve '1/1 "%.2x"' > /jwt.hex
  echo "jwt.hex generated."
else
  echo "Using existing jwt.hex."
fi

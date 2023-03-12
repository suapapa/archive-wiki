#!/bin/sh
set -e

# Copy data from container-2 to shared volume
tar -C /tmp/data -czf - . | tar -C /data -xzf -
#!/bin/bash

# Define the entry to be added
HOST_ENTRY="127.0.0.1 localhost"

echo "Updating hosts file... $OSTYPE"
# Detect platform (Linux, WSL, or Windows)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux: Update /etc/hosts
    if grep -q "$HOST_ENTRY" /etc/hosts; then
        echo "Entry already exists in /etc/hosts"
    else
        echo "$HOST_ENTRY" | sudo tee -a /etc/hosts > /dev/null
        echo "Added $HOST_ENTRY to /etc/hosts"
    fi
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows (Cygwin or MSYS)
    HOSTS_FILE="/c/Windows/System32/drivers/etc/hosts"
    if grep -q "$HOST_ENTRY" "$HOSTS_FILE"; then
        echo "Entry already exists in hosts file"
    else
        echo "$HOST_ENTRY" | sudo tee -a "$HOSTS_FILE" > /dev/null
        echo "Added $HOST_ENTRY to hosts file"
    fi
elif [[ "$OSTYPE" == "linux-musl" ]]; then
    # WSL: Update /etc/hosts (works on WSL2)
    if grep -q "$HOST_ENTRY" /etc/hosts; then
        echo "Entry already exists in /etc/hosts"
    else
        echo "$HOST_ENTRY" | sudo tee -a /etc/hosts > /dev/null
        echo "Added $HOST_ENTRY to /etc/hosts"
    fi
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi

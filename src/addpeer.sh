#!/bin/sh
set -e

# Generate keys
private_key=$(wg genkey)
public_key=$(echo $private_key | wg pubkey)

# Add keys to server
wg set wg0 peer $public_key allowed-ips $client_ip/32

# Generate client config
cat > /opt/wg-spry/generated/spry-wg-us-tx1.conf << _EOF
[Interface]
PrivateKey = $private_key
Address = $client_ip/32
DNS = 10.200.200.1

[Peer]
PublicKey = kumeo8QaX4DXqSjZsKRiCuQ7dpA8u6HDWD4W0drlk1c=
Endpoint = 69.162.114.122:51820
AllowedIPs = 0.0.0.0/0, ::/0
_EOF

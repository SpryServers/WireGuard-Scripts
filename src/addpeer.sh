#!/bin/bash
#
#   WireGuard Provisioning Scripts
#
#   @author Tab Fitts
#
#   Copyright (C) 2018 Spry Servers, LLC. https://www.spryservers.net. All rights Reserved.
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License version 2,
#   as published by the Free Software Foundation.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
set -e

# Generate keys
private_key=$(wg genkey)
public_key=$(echo $private_key | wg pubkey)

# Get next available IP for client (temporary dirty hack until we can implement something better)
client_ip=$(all="$(wg show wg0 allowed-ips)"; for ((i=2; i<=254; i++)); do ip="10.200.200.$i"; [[ $all != *$ip/32* ]] && echo $ip && break; done)

# Add keys to server
wg set wg0 peer $public_key allowed-ips $client_ip/32

# Generate client config
umask u=rwx,g=rwx,o= && cat > /opt/wg-provision/generated/spry-wg-us-tx1-$client_ip.conf << _EOF
[Interface]
PrivateKey = $private_key
Address = $client_ip/32
DNS = 10.200.200.1

[Peer]
PublicKey = kumeo8QaX4DXqSjZsKRiCuQ7dpA8u6HDWD4W0drlk1c=
Endpoint = 69.162.114.122:51820
AllowedIPs = 0.0.0.0/0, ::/0
_EOF

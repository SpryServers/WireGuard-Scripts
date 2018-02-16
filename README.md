# WireGuard Provisioning Scripts

### Note: This is under heavy development. I provide no warranty as to the security or operation of these scripts! Use with caution!

## Objective 
Fully automate WireGuard server provisioning and client configuration generation.

## Instructions
1. Edit server/src/addpeer.sh with your server information (public key, ip, IP range, interface, etc)
2. From the server folder in this repository run: $ sudo ./install.sh. To add a client:
3. $ sudo /opt/wg-provision/addpeer.sh
4. Client configuration file will be available at /opt/wg-provision/generated

## Todo
1. Alot. I'll update this later.

---------------------------------
*WireGuard <https://www.wireguard.com> is licensed under the GPL2, copyright Jason A. Donenfeld <Jason@zx2c4.com>

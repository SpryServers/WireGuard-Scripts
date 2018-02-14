# WireGuard Provisioning Scripts

### Note: This is under heavy development. I provide no warranty as to the security or operation of these scripts! Use with caution!

## Objective 
Fully automate WireGuard server provisioning and client configuration generation. Create a bash wrapper to run the WireGuard server configuration as a single regular user.

## Instructions
1. Edit src/addpeer.sh with your server information (public key, ip, IP range, interface, etc)
2. Make sure you have gcc installed
3. From the root of this repository run: $ sudo ./install.sh
4. To add a client:
- $ sudo su wg-provision
- From the git directory: $ php -f wg-gen.php
- OR $ /opt/wg-provision/wg-provision
5. Client configuration file will be available at /opt/wg-provision/generated

## Todo
1. Alot. I'll update this later.

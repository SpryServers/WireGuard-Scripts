#!/bin/sh

install_dir=/opt/wg-provision
mkdir -p $install_dir
mkdir $install_dir/generated

gcc src/wrapper.c -o $install_dir/wg-provision

chown root $install_dir/wg-provision
chmod u=rwx,go=xr,+s $install_dir/wg-provision

cp -R src/addpeer.sh $install_dir/
cp -R src/ip.sh $install_dir/
chown root $install_dir/*.sh
chmod u=rwx,go=xr $install_dir/*.sh

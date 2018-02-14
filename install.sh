#!/bin/sh

install_dir=/opt/wg-provision
useradd  wg-provision;

mkdir -p $install_dir
mkdir -p $install_dir/generated

chown -R wg-provision $install_dir

gcc src/wrapper.c -o $install_dir/wg-provision

chown root:wg-provision $install_dir/wg-provision
chmod u=rwx,g=xr,o=r,+s $install_dir/wg-provision

cp -R src/addpeer.sh $install_dir/
chown root $install_dir/*.sh
chmod u=rwx,go=xr $install_dir/*.sh

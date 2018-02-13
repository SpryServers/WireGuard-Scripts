#!/bin/sh

export install_dir=/opt/wg-spry
mkdir -p $install_dir

gcc src/wrapper.c -o $install_dir/wg_php_root

chown root $install_dir/wg_php_root
chmod u=rwx,go=xr,+s $install_dir/wg_php_root

cp src/addpeer.sh $install_dir/
chown root $install_dir/addpeer.sh
chmod u=rwx,go=xr $install_dir/addpeer.sh

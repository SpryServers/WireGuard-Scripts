#!/bin/sh
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
install_dir=/opt/wg-provision
useradd  wg-provision;

mkdir -p $install_dir
mkdir -p $install_dir/generated

chown -R root:wg-provision $install_dir

gcc src/wrapper.c -o $install_dir/wg-provision

chown root:wg-provision $install_dir/wg-provision
chmod u=rwx,g=xr,o=r,+s $install_dir/wg-provision

cp -R src/addpeer.sh $install_dir/
chown root:root $install_dir/*.sh
chmod u=rwx,go=xr $install_dir/*.sh

<?php

$ssh = ssh2_connect('wg-server.hostname');
ssh2_auth_pubkey_file($ssh, 'wg-provision', '/home/user/.ssh/id_rsa.pub', '/home/user/.ssh/id_rsa');

ssh2_exec($ssh, 'sudo /opt/wg-provision/addpeer.sh');

?>

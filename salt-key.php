<?php
// author: pWakeem
// Script that accepts/authenticates all waiting salt-keys.
// Indended to be called by the salt-bootstrap script.
// www user will need sudo nopasswd access to salt-key to use this.

shell_exec("sudo salt-key -A -q -y");
echo '{"keys_accepted":"true"}';

?>

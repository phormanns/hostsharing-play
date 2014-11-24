## Hostsharing Playbooks

Ansible Modules and Playbooks for use with Hostsharing webhosting 
packages.

### Modules

#### Hostsharing User

The module __hsuser__ ensures that a particular account exists.

Parameters:
* __name__ : account name (including package prefix)
* __password__ : account password
* __exists__ : "true" account shoukd be created / "false" account should be removed

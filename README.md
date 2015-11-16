## Hostsharing Playbooks

Ansible Modules and Playbooks for use with Hostsharing webhosting 
packages.

Prerequisite for the use of these modules is to create a file
".hsadmin.properties" in the home directory of the package admins.
In it, you have to define the password of the package admin.

For example:

    xyz00@h99:~$ cat .hsadmin.properties 
    xyz00.passWord=geheimwort

### Inventory

To call Ansible you need a so-called __inventory__. This is a list of 
servers or packages, or (more generally) of installations.

A Sample-Inventory:


    xyz00 ansible_ssh_host=xyz00.hostsharing.net ansible_ssh_user=xyz00 pac=xyz00 
   
Installation of wordpress by:

    ansible-playbook -i /pfad/zum/inventory wordpress.play

Alternatively, the inventory is defined via an environment 
variable "ANSIBLE_HOSTS". For example:

    export ANSIBLE_HOSTS=/home/user/.ansible_pacs 

### Modules

#### Hostsharing User

The module __hsuser.js__ ensures that a particular account exists.
Parameters:
* __name__ : account name (including package prefix)
* __password__ : account password
* __exists__ : "true" account should be created / "false" account should be removed

#### Hostsharing Database

The module __hsdatabase.js__ ensures that a particular database and database 
user exist. Database and user have the same name.
Parameters:
* __instance__ : "mysql" or "postgresql"
* __name__ : database and database-user name (including package prefix)
* __password__ : database-user password
* __exists__ : "true" database should be created / "false" database should be removed

#### Hostsharing Domain

The module __hsdomain.js__ ensures that a particular domain exists.
Parameters:
* __name__ : domain name
* __owner__ : domain admin user 
* __exists__ : "true" domain should be set up / "false" domain should be removed

## Hostsharing Playbooks

Ansible Modules and Playbooks for use with Hostsharing webhosting 
packages.

Voraussetzung für die Nutzung dieser Module ist das Anlegen einer Datei
".hsadmin.properties" im Heimatverzeichnis des/der Paket-Admins.
Darin muss das Passwort des jeweiligen Paket-Admins abgelegt sein.

Zum Beispiel:

>
> xyz00@h99:~$ cat .hsadmin.properties 
> xyz00.passWord=geheimwort
>

### Inventory

Für den Aufruf von Ansible benötigt man ein sogenanntes __Inventory__, ein
Verzeichnis der Server oder Pakete oder allegemeiner der Installationen.

Ein Beispiel für ein Inventory:

>
> [wordpress]
> xyz00 ansible_ssh_host=xyz00.hostsharing.net ansible_ssh_user=xyz00 pac=xyz00 \\
>   domain=example.com user=wp password=nocheingeheimwort
>
> [joomla]
> xyz00 ansible_ssh_host=xyz00.hostsharing.net ansible_ssh_user=xyz00 pac=xyz00 \\
>   domain=example.org user=joomla password=wiedereingeheimwort
>

Installation von Wordpress mit:

>
> ansible-playbook -i /pfad/zum/inventory wordpress.play
>

Alternativ kann das Inventory über die Environment-Variable "ANSIBLE_HOSTS"
definiert werden. Zum Beispiel:

>
> export ANSIBLE_HOSTS=/home/user/.ansible_pacs 
>

### Modules

#### Hostsharing User

The module __hsuser.js__ ensures that a particular account exists.
Parameters:
* __name__ : account name (including package prefix)
* __password__ : account password
* __exists__ : "true" account should be created / "false" account should be removed

#### Hostsharing Database

The module __hsdatabase.js__ ensures that a particular account exists.
Parameters:
* __instance__ : "mysql" or "postgresql"
* __name__ : database and database-user name (including package prefix)
* __password__ : database-user password
* __exists__ : "true" database should be created / "false" database should be removed

#### Hostsharing Domain

The module __hsdomain.js__ ensures that a particular account exists.
Parameters:
* __name__ : domain name
* __owner__ : domain admin user 
* __exists__ : "true" domain should be set up / "false" domain should be removed

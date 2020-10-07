# LMS SERVER provisioning playbook

Provision all packages and base configuration needed to build a LMS-server instance/image

## Prerequisites

```
ansible 2.0
```

## Variables

- All variables are set on the file *hosts.yml*
- hosts.yml is strcuted in two sections:

#### Hosts
In this section should be provided a alias for the host or group of hosts and the target IP(s)

```
[remote]
<ip_address>
```

for a local host as target:

```
[local]
127.0.0.1
```

#### Variables
In this section should be provided the varibales requeried by the playbooks

* ansible_user - user to access the system - e.g. *centos*
* ansible_ssh_private_key_file - priviate key used to access the system

* public_key - key to be added to created user
* php_version - specific version of PHP to be installed e.g. for php70u -> *70u*
* ixgbevf_version - version for AWS Enhanced Networking driver e.g. *4.2.2*


```
[remote:vars]
#connection
ansible_user=<system_user>
ansible_ssh_private_key_file=<pem_file_path>
ansible_become=true
ansible_become_user=root

#chroot
data_folder=/var/www/data

#users
public_key=<public_key>

#swap
swapfile_path=/extra_swap
swapfile_size=2048

#PHP
php_version=70u

#AWS Enhanced Networking
ixgbevf_version=4.2.2

```

## Running

```
ansible-playbook -i ./hosts lms-server.yml
```

## Components

The file *lms-server.yml* includes all others necessary playbooks.

playbooks can be added or removed as needded.

```
- include: repos.yml
- include: packages.yml
- include: swap.yml
- include: users.yml
- include: iptables.yml
- include: php.yml
- include: composer.yml
- include: moosh.yml
- include: aws.yml
- include: nginx.yml
- include: solr.yml
- include: unoconv-server.yml
```

## Authors

* **Marcos Rcoha** - *Initial work* -

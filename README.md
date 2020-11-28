# lms-server

Ansible for base LMS OS

## Pipelines

### Master

[![pipeline status](https://git.lambdasolutions.net/infrastructure/lambda-ansible-playbook/badges/master/pipeline.svg)](https://git.lambdasolutions.net/infrastructure/lambda-ansible-playbook/-/commits/master)

### Centos 8

[![pipeline status](https://git.lambdasolutions.net/infrastructure/lambda-ansible-playbook/badges/centos8/pipeline.svg)](https://git.lambdasolutions.net/infrastructure/lambda-ansible-playbook/-/commits/centos8)

---

## Usage

```bash
ansible-playbook -i hosts lms-server.yml
```

## Variables

### CI

- `USER` : "centos"
- `PHP_VERSION` : `7.2` , `7.3` or `7.4` - from REMI repo
- `LMS_TYPE` : `moodle` or `totara` - defaults to `moodle`
- `LOCAL_USER` : if want local user to be added to the image - defaults to `true`

### lms-server.yml

- `public_key` : ssh public key to be added to user `sysop`

---

## Requirements

- CentOS 8

---

## Packages Versions

### MySQL

- 5.7 community

### PHP

selectable by varibale `php_version` from repo `REMI`

- 7.2
- 7.3
- 7.4

---

## AWS ENA

ENA pre installed with CentOS 8

---

## OS Hardening

<https://github.com/dev-sec/ansible-os-hardening>

It configures:

- Configures package management e.g. allows only signed packages
- Remove packages with known issues
- Configures pam and pam_limits module
- Shadow password suite configuration
- Configures system path permissions
- Disable core dumps via soft limits
- Restrict root Logins to System Console
- Set SUIDs
- Configures kernel parameters via sysctl
- Install and configure auditd

---

## Molecule

<https://molecule.readthedocs.io/en/latest/>

Molecule project is designed to aid in the development and testing of Ansible roles.

### Molecule Usage

```bash
cd lms-server
molecule test
```

- requirements: Python >= 3.6 with Ansible >= 2.8

- install:

```bash
python3 -m pip install ansible molecule[docker]
```

---

## To Do

- enbale CI molecule ansible tests

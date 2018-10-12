# test ansible playbook on docker

## Requirements

* Docker Engine
* Docker Compose
* Ansible

```
$ bash test_docker.sh
```

## Links

* https://hub.docker.com/r/suzukishunsuke/ansible-test-centos/
* Docker privileged option
  * https://docs.docker.com/compose/compose-file/#domainname-hostname-ipc-mac_address-privileged-read_only-shm_size-stdin_open-tty-user-working_dir
  * https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities
* Docker Connection Plugin
  * https://docs.ansible.com/ansible/2.6/plugins/connection.html
  * https://docs.ansible.com/ansible/2.6/plugins/connection/docker.html

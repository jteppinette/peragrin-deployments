# Deployments - *terraform resources and ansible scripts to create peragrin.com*

## Use

```
$ git clone <repo-url> deployments && cd deployments
$ export WORKDIR=`pwd`
$ export DO_API_TOKEN=<digital-ocean-pat>
$ export SSH_FINGERPRINT=<md5-fingerprint> # This can be received with `ssh-keygen -lf <id_rsa-path> -E md5` and taking the fingerprint portion.
$ cd terraform
$ terraform plan -var "do_api_token=${DO_API_TOKEN}" -var "ssh_fingerprint=${SSH_FINGERPRINT}"
$ terraform apply -var "do_api_token=${DO_API_TOKEN}" -var "ssh_fingerprint=${SSH_FINGERPRINT}"
$ cd ${WORKDIR}
$ ansible-playbook -u root -i digitalocean.py docker.yml      # Install Docker CE on each host.
$ ansible-playbook -u root -i digitalocean.py swarm.yml       # Connect the nodes to a "manager/worker" Swarm cluster.
$ ansible-playbook -u root -i digitalocean.py stack.yml       # Upload the Stack file and necessary config files, start the services.
```

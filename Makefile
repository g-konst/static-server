.PHONY: ps rm attach build stop playbook ping ssh up down

COMPOSE = docker-compose -f docker/docker-compose.yml
CONTAINER = static_server
CSHELL = bash

ANSIBLE_CONFIG = $$(pwd)/ansible/ansible.cfg

SSH_DIR = ~/.ssh

ps:
	$(COMPOSE) ps -a

rm: stop
	$(COMPOSE) rm $(CONTAINER)

attach:
	$(COMPOSE) exec -it $(CONTAINER) /bin/$(CSHELL)

build:
	$(COMPOSE) up --build

up:
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down

playbook:
	ANSIBLE_CONFIG=$(ANSIBLE_CONFIG) ansible-playbook -i ansible/inventory.ini ansible/playbook.yml -K

ping:
	ansible -i ansible/inventory.ini all -m ping

ssh:
	@ssh -i $(SSH_DIR)/id_rsa_$(user) -p 2201 $(user)@localhost

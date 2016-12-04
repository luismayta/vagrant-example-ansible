# Makefile for vagrant-example-ansible.

# Configuration.
SHELL = /bin/bash
ROOT_DIR = $(shell pwd)
BIN_DIR = $(ROOT_DIR)/bin
DATA_DIR = $(ROOT_DIR)/var
SCRIPT_DIR = $(ROOT_DIR)/script

WGET = wget
VIRTUALENV_DIR = $(ROOT_DIR)/lib/virtualenv
PIP = $(VIRTUALENV_DIR)/bin/pip
NOSE = $(BIN_DIR)/nosetests
PYTHON = $(VIRTUALENV_DIR)/bin/python

# Bin scripts
ANSIBLE_PROVISION= $(shell) $(SCRIPT_DIR)/provision.sh
ANSIBLE_DEPLOY= $(shell) $(SCRIPT_DIR)/deploy.sh
CLEAN = $(shell) $(SCRIPT_DIR)/clean.sh
CLEAN_MIGRATIONS = $(shell) $(SCRIPT_DIR)/clean_migrations.sh
INSTALL = $(shell) $(SCRIPT_DIR)/install.sh
SETUP = $(shell) $(SCRIPT_DIR)/setup.sh
DROP_DATABASE = $(shell) $(SCRIPT_DIR)/drop_database.sh
TEST = $(shell) $(SCRIPT_DIR)/test.sh
PM = $(shell) $(SCRIPT_DIR)/pm.sh
ROLES_ANSIBLE = $(shell) $(SCRIPT_DIR)/roles_ansible.sh
GVM = $(shell) $(SCRIPT_DIR)/gvm.sh
GRIP = $(shell) $(SCRIPT_DIR)/grip.sh
PYENV = $(shell) $(SCRIPT_DIR)/pyenv.sh
PLUGINS_VAGRANT = $(shell) $(SCRIPT_DIR)/plugins_vagrant.sh
RUNSERVER = $(shell) $(SCRIPT_DIR)/runserver.sh
SYNC = $(shell) $(SCRIPT_DIR)/sync.sh

install:
	$(INSTALL)


pm:
	echo "${action}"
	@if [ "${action}" == '' ]; then \
        echo "Error: Variables not set correctly"; exit 2; \
	fi
	$(PM) "${action}"


populate:
	$(POPULATE)


populate_test:
	$(POPULATE_TEST)


plugins_vagrant:
	$(PLUGINS_VAGRANT)


roles:
	$(ROLES_ANSIBLE)


ansible_provision:
	$(ANSIBLE_PROVISION)


ansible_deploy:
	$(ANSIBLE_DEPLOY)


create_database:
	$(CREATE_DATABASE)


clean:
	$(CLEAN)


clean_migrations: clean
	$(CLEAN_MIGRATIONS)

environment:
		$(PYENV)
		$(GVM)

setup:
	$(SETUP)

deploy:
	$(ANSIBLE_PROVISION)
	$(ANSIBLE_DEPLOY)


distclean: clean
	rm -rf $(ROOT_DIR)/lib
	rm -rf $(ROOT_DIR)/*.egg-info
	rm -rf $(ROOT_DIR)/demo/*.egg-info


maintainer-clean: distclean
	rm -rf $(BIN_DIR)
	rm -rf $(ROOT_DIR)/lib/


sync:
	$(SYNC)

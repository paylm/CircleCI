
.DEFAULT_GOAL := help


help:
	@echo 'APITable Integration Environment Ansible Script'

install:
	ansible-playbook install.yml

run:
	ansible-playbook run.yml -e "CR_PAT=${CR_PAT}"

update-app:
    #example make update-app app=backend-server tag=latest-alpha
	ansible-playbook update.yml -e "app=${app}" -e "tag=${tag}" -e "CR_PAT=${CR_PAT}"

.PYTHON: help

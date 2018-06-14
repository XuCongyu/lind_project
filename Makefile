#
# Makefile - Docker commands for Lind
#
# AUTHOR: Joey Pabalinas <alyptik@protonmail.com>


%: | pull
	@$(MAKE) "lind/$(basename $(notdir $*))"

lind/%:
	docker run -it alyptik/lind /bin/bash -c './caging.sh $*'

.PHONY: Makefile lind run shell bash list show latest prebuiltsdk base stack deploy pull clean prune

lind run shell bash: | pull
	docker run -it alyptik/lind /bin/bash

list show:
	docker image list -f=label=lind -a
	docker container list -f=label=lind -a

latest: | prebuiltsdk
	docker build --compress=true --cache-from=alyptik/lind:prebuiltsdk -t alyptik/lind ./docker/prebuiltsdk

prebuiltsdk: | base
	docker build --compress=true --cache-from=alyptik/lind:base -t alyptik/lind:$@ ./docker/$@

base:
	docker build --compress=true -t alyptik/lind:$@ ./docker/$@

stack deploy:
	docker stack deploy -c ./docker/docker-compose.yml lindstack

pull:
	docker pull alyptik/lind

clean prune:
	docker image prune
	docker container prune
	docker stack rm lindstack
	docker swarm leave --force

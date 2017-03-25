all: setup build

setup: client-setup server-setup

build: client-build server-build

install:
	stack install

# Will only run if inside the docker container
docker-rsync:
	if ! [ -z "$$DOCKER_RSYNC" ] && [ "$$DOCKER_RSYNC" = "true" ]; then rsync -acipruv /home/host/whenisbad/ /home/code/whenisbad; fi

client-setup:
	(cd client ; elm -v || npm install -g elm; elm package install -y)

client-build: docker-rsync
	(cd client ; make)

server-setup:
	stack setup --allow-different-user
	stack test --only-dependencies --allow-different-user

server-build: docker-rsync
	stack build

server-start: server-build
	stack exec whenisbad-exe

test:
	stack test
	(cd client ; make run-tests)
	(cd client ; make)

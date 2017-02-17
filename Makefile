all: setup build

setup: client-setup server-setup

build: client-build server-build

client-setup:
	(cd client ; elm -v || npm install -g elm; elm package install -y)

client-build:
	(cd client ; make)

server-setup:
	stack setup
	stack test --only-dependencies

server-build:
	stack build

server-start: server-build
	stack exec whenisbad-exe

test:
	stack test
	(cd client ; make run-tests)
	(cd client ; make)

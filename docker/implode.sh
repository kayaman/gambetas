#!/bin/bash

function rm_all {
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q) --force
}

function do_nothing() {
	echo -e '\033[1;32mOK! Bye\033[m'
	exit 0
}

read -r -p "Remove ALL Docker images and containers. Are you sure? [yes/N]: " response
case "$response" in
    [yY][eE][sS])
        rm_all
        ;;
    *)
        do_nothing
        ;;
esac

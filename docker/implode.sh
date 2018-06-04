#!/usr/bin/env bash -e
## Complaints to: 'Marco Antonio Gonzalez Junior <marco@intergalactic.ai>'

# Remove all Docker images and containers
# WARNING: Cannot be undone

function rm_all {
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q) --force
}

function do_nothing() {
	echo -e '\033[1;32mOK! Bye\033[m'
	exit 0
}

read -r -p "Are you sure? [yes/N]: " response
case "$response" in
    [yY][eE][sS]|[yY])
        rm_all
        ;;
    *)
        do_nothing
        ;;
esac

function start_docker() {
	docker-machine start
	docker-machine env
	eval "$(docker-machine env default)"
}

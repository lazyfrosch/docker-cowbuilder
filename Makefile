all:
	docker pull debian:stretch
	docker build -t lazyfrosch/cowbuilder --rm .

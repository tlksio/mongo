up:
	docker run --name db -v `pwd`/data:/data/db -d mongo:latest

ui:
	docker run --name mongo-express -d -p 8081:8081 --link db:mongo mongo-express:latest

cli:
	docker run -it --link db:mongo --rm mongo:latest sh -c 'exec mongo "$$MONGO_PORT_27017_TCP_ADDR:$$MONGO_PORT_27017_TCP_PORT/talks"'

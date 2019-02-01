default: lint build run

lint:
	golint -set_exit_status app.go && echo ok

build:
	go build -o app

run:
	./app

docker:
	docker build -t haphan/echo-app:latest .
	docker push haphan/echo-app:latest

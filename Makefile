ECR := 617683844790.dkr.ecr.us-east-2.amazonaws.com
NAME := "aws-http-redirect"
PORT := "80"
CONTAINTER_PORT := "8000"

.PHONY: all build run test logs kill push clean

all: build run test kill

build:
	docker build -t $(NAME) .

run: build .run

.run:
	docker run -d -p $(PORT):$(CONTAINTER_PORT) --name $(NAME) $(NAME)
	touch $@

test: run
	python3 tests.py

logs:
	docker logs $(NAME)

kill:
	-docker kill $(NAME)
	-docker rm $(NAME)
	rm .run

push:
	docker tag $(NAME):latest $(ECR)/$(NAME):latest
	docker push $(ECR)/$(NAME):latest

clean:  kill
	-docker rmi $(NAME)

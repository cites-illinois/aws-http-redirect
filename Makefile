ECR := 617683844790.dkr.ecr.us-east-2.amazonaws.com
NAME := "aws-http-redirect"

.PHONY: all build run test logs kill push clean

all: build run test kill

build:
	docker build -t $(NAME) .

run: build
	docker run --rm -d -p 8000:8000 --name $(NAME) $(NAME)

test: run
	python tests.py

logs:
	docker logs $(NAME)

kill:
	-docker kill $(NAME)

push:
	docker tag $(NAME):latest $(ECR)/$(NAME):latest
	docker push $(ECR)/$(NAME):latest

clean:  kill
	-docker rmi $(NAME)

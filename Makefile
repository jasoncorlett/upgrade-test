.PHONY: all build clean test

image = jasoncorlett/upgrade-test

all: clean build test

build:
	docker build ./app --build-arg MESSAGE=First --build-arg VERSION=0.1 -t $(image):0.1
	docker build ./app --build-arg MESSAGE=Second --build-arg VERSION=0.2 -t $(image):0.2
	docker build ./app --build-arg MESSAGE=Third --build-arg VERSION=0.3 -t $(image):0.3
	docker tag $(image):0.3 $(image):latest

clean:
	-@docker images --filter reference=$(image) -q | xargs docker rmi -f

test:
	cp -v app/wrapper.sh wrapper
	./wrapper upgrade 0.1
	./wrapper version
	./wrapper "Simple Test" "Hello, World"

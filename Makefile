DIRS := haproxy rsyslogd
DEPS := $(patsubst %,.%,$(DIRS))

.PHONY: all build run test logs kill push clean

all: test kill

build: $(DEPS)

.haproxy: $(wildcard haproxy/*)

.rsyslogd: $(wildcard rsyslogd/*)

.%:
	docker-compose build $*
	touch $@

run: .run

.run: build
	docker-compose up -d
	touch $@

test: run
	python3 tests.py

logs:
	docker-compose logs

kill:
	-docker-compose down
	-rm .run

clean: kill
	-rm -f $(DEPS)

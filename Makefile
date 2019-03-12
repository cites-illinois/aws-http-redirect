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

run: build .run

.run: docker-compose.yml $(DEPS)
	docker-compose up -d --remove-orphans
	touch $@

test: run
	python3 tests.py

logs:
	docker logs aws-http-redirect_rsyslogd_1

kill:
	-docker-compose down
	-rm .run

clean: kill
	-rm -f $(DEPS)

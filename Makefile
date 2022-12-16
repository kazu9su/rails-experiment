GOBIN ?= $(shell go env GOPATH)/bin

.PHONY: all
all:
	cd cmd/goserver       && go build

.PHONY: clean
clean:
	rm -f cmd/goserver/goserver

.PHONY: install-tools
install-tools: $(GOBIN)/air

$(GOBIN)/air:
	curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(GOBIN)

.PHONY: launch
launch:
	go run ./...

# "test" is expected to run on an environment that can connect to postgres.
# (e.g. docker-compose, or CircleCI)
.PHONY: test
test:
	env CGO_ENABLED=1 go test -race ./...


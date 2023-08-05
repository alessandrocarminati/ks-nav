
all: main.go data.go
	go build

data.go: data
	${GOBIN}/go-bindata -o data.go data/templates/ data/confs/


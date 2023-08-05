EXECUTABLE=navweb
INSTALL_DIR=/usr/bin/

all: main.go data.go
	go build

data.go: data
	${GOBIN}/go-bindata -o data.go data/templates/ data/confs/

install: $(EXECUTABLE)
	cp $(EXECUTABLE)  $(INSTALL_DIR)

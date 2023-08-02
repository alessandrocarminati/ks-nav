EXECUTABLE=navweb
INSTALL_DIR=/usr/bin/

all: main.go
	make -C nav
	go build -o $(EXECUTABLE)

install: $(EXECUTABLE)
	cp $(EXECUTABLE)  $(INSTALL_DIR)


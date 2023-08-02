# BUILDER
FROM alpine:latest AS builder

RUN apk add --no-cache autoconf automake build-base git

RUN apk add --no-cache go

WORKDIR /build

# Build radare2
RUN git clone https://github.com/radareorg/radare2.git /build/radare2 && cd /build/radare2 && git checkout ecd8d00aad289abf8f850b45d5f6c2e6b0c15c0f

RUN cd /build/radare2 && \
    ./configure && \
    make && \
    make install

# Build ks-nav
RUN git clone https://github.com/elisa-tech/ks-nav /build/ksnav

RUN cd /build/ksnav/kern_bin_db && \
    make && \
    make install

RUN cd /build/ksnav/nav && \
    make && \
    make install

RUN cd /build/ksnav/navweb && \
    make && \
    make install


# RUNTIME
FROM alpine:latest

# install dependencies
RUN apk add --no-cache postgresql postgresql-contrib
RUN apk add --no-cache binutils

# setup resources
WORKDIR /app
COPY --from=builder /app/c_app_source_code/c_app_binary /app/c_app
COPY --from=builder /app/golang_app_source_code/app /app
EXPOSE 8080

CMD ["/usr/bin/navweb"]


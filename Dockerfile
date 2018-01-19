FROM i686/ubuntu

ENV GOLANG_VERSION=1.9.2
ENV GOLANG_SHA256=574b2c4b1a248e58ef7d1f825beda15429610a2316d9cbd3096d8d3fa8c0bc1a
ENV GOLANG_ARCH=linux-386

# gcc for cgo
RUN apt-get update && apt-get install -y --no-install-recommends \
		g++ \
		gcc \
		libc6-dev \
		make \
		pkg-config \
		libssh2-1-dev \
		git \
		cmake \
		sudo \
		wget \
		ca-certificates \
	&& rm -rf /var/lib/apt/lists/*

RUN set -eux; \
	wget -O go.tgz https://golang.org/dl/go${GOLANG_VERSION}.${GOLANG_ARCH}.tar.gz; \
	echo "${GOLANG_SHA256} *go.tgz" | sha256sum -c -; \
	tar -C /usr/local -xzf go.tgz; \
	rm go.tgz; \
	export PATH="/usr/local/go/bin:$PATH"; \
	go version

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

COPY go-wrapper /usr/local/bin/

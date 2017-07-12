# Generic 32-bit Linux golang build image

Use the latest official Golang Docker image but this image adds cmake so you can cross compile for Linux and it is compiled & running on a Linux 32-bit architecture.  Useful when you need to build specifically for 32-bit / i386 architecture.

## Usage

```shell
docker run --rm -v "$PWD":/go/bin jhaynie/golang-linux32 go get github.com/yourname/yourrepo
```

## License

Public Domain

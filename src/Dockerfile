FROM golang:1.18

COPY . .
RUN unset GOPATH && \
go build -v -o app

ENTRYPOINT "./app"

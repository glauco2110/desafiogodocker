FROM golang:1.11.2-alpine as builder 

WORKDIR /go/src/app
COPY . .
RUN go get -v ./...
RUN go build

FROM scratch

WORKDIR /home

COPY --from=builder /go/src/app/app .
CMD ["./app"]
FROM golang:latest AS go
WORKDIR /go/src/app
COPY app/ .
RUN go build main.go

FROM scratch
WORKDIR /go/src/app
COPY --from=go /go/src/app/main .
CMD ["./main"]
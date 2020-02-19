FROM golang:alpine AS builder

WORKDIR /go/src/app
COPY main.go .

RUN CGO_ENABLED=0 go build -o webserver .

FROM scratch
WORKDIR /app
COPY --from=builder /go/src/app/ /app/

CMD ["./webserver"]

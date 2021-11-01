FROM golang:1.17.2 AS builder
WORKDIR /go/src/app
COPY full-cycle.go .
RUN go build full-cycle.go
FROM scratch 
COPY --from=builder /go/src/app/full-cycle .
ENTRYPOINT ["./full-cycle"] 

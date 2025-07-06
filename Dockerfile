FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY ./main.go /app/

RUN go build main.go

FROM scratch

COPY --from=builder /app/main .

CMD ["./main"]

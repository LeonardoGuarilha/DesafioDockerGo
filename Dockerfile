FROM golang:alpine3.15 as base

WORKDIR /go/app

COPY main.go /go/app/

RUN go build /go/app/main.go

FROM scratch

WORKDIR /go/src
COPY --from=base /go/app/main .
CMD ["/go/src/main"]
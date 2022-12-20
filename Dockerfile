FROM golang:latest as build

RUN CGO_ENABLED=0 go install github.com/bazelbuild/buildtools/buildifier@latest

FROM gcr.io/distroless/static-debian11

COPY --from=build /go/bin/buildifier /bin/buildifier
ENTRYPOINT ["buildifier"]

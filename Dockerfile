# Builder
FROM golang:latest as builder

# Source
WORKDIR /workspace
ADD . /workspace

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -a -o gohello main.go

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
FROM gcr.io/distroless/static:nonroot
WORKDIR /
COPY --from=builder /workspace/gohello .

USER nonroot:nonroot

ENTRYPOINT ["/gohello"]
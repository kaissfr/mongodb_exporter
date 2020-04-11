FROM arm64v8/golang:1.13


WORKDIR /go/src/github.com/percona/mongodb_exporter

COPY . .

RUN make build

FROM arm64v8/busybox:latest


COPY --from=0 /go/src/github.com/percona/mongodb_exporter/bin/mongodb_exporter /bin/mongodb_exporter

EXPOSE 9216

ENTRYPOINT [ "/bin/mongodb_exporter" ]


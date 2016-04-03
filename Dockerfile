FROM scratch
COPY mesos-exporter /
ENTRYPOINT ["/mesos-exporter"]

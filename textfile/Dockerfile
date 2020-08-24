ARG BASE_IMAGE=alpine:latest

FROM $BASE_IMAGE as builder
ADD https://github.com/prometheus-community/node-exporter-textfile-collector-scripts/archive/master.tar.gz /tmp/
RUN mkdir /scripts && tar xfz /tmp/master.tar.gz -C /scripts --strip-components 1

FROM $BASE_IMAGE
RUN apk add dumb-init smartmontools bash
COPY --from=builder /scripts /scripts
COPY /textfile/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["dumb-init"]
CMD ["/entrypoint.sh"]

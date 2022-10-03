ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
    python3

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /

# Copy data for add-on
COPY run.sh /
COPY GoSungrow_amd64 /
COPY GoSungrow_arm64 /

RUN chmod a+x /run.sh
RUN chmod a+x /GoSungrow_amd64
RUN chmod a+x /GoSungrow_arm64

CMD [ "/run.sh" ]

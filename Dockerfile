FROM nicolaka/netshoot:v0.9

COPY motd motd

# install hey (https://github.com/rakyll/hey)
RUN curl https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 -o hey  \
    && chmod +x hey  \
    && mv hey /usr/bin/hey

# install rclone
ENV RCLONE_BINARY_VERSION=v1.64.0
RUN curl -O https://downloads.rclone.org/v1.64.0/rclone-"$RCLONE_BINARY_VERSION"-linux-amd64.zip \
    && unzip rclone-"$RCLONE_BINARY_VERSION"-linux-amd64.zip \
    && cd rclone-*-linux-amd64 \
    && cp rclone /usr/bin/ \
    && chown root:root /usr/bin/rclone \
    && chmod 755 /usr/bin/rclone \
    && cd .. \
    && rm -r rclone*

# install kubectl
ENV KUBECTL_VERSION=v1.28.2
RUN curl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

CMD ["/bin/bash"]
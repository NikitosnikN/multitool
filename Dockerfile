FROM nicolaka/netshoot:v0.9

COPY motd motd

# install hey (https://github.com/rakyll/hey)
RUN curl https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 -o hey  \
    && chmod +x hey  \
    && mv hey /usr/bin/hey

CMD ["zsh"]
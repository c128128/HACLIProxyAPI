ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install runtime dependencies
RUN apk add --no-cache \
    curl \
    jq

# Set working directory for CLIProxyAPI files
WORKDIR /data

# Copy CLIProxyAPI binary from official image
COPY --from=eceasy/cli-proxy-api:latest /CLIProxyAPI/CLIProxyAPI ./CLIProxyAPI

# Copy config and run script
COPY CLIProxyAPI.yaml ./config.yaml
COPY run.sh ./run.sh
RUN chmod +x ./run.sh

# Set entrypoint
CMD ["/data/run.sh"]

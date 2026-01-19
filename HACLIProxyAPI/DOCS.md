# Session Key

## Run this to get the `Session Key` for `OpenAI`. For other providers, check https://help.router-for.me/docker/docker.html.

```bash
docker run -it --rm \
  -p 8317:8317 \
  -p 8085:8085 \
  -p 1455:1455 \
  -p 54545:54545 \
  -p 51121:51121 \
  -p 11451:11451 \
  -v $(pwd):/root/.cli-proxy-api \
  eceasy/cli-proxy-api:latest \
  /bin/sh -c "
    echo -e 'host: 0.0.0.0\nport: 8317\nauth-dir: /root/.cli-proxy-api\ndebug: false' > /tmp/config.yaml && \
    /CLIProxyAPI/CLIProxyAPI -config /tmp/config.yaml & \
    sleep 2 && \
    /CLIProxyAPI/CLIProxyAPI -config /tmp/config.yaml -codex-login && \
    wait
  "
```

The Session Key file will be saved in the directory where you ran the command.
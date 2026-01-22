# CLIProxyAPI add-on that runs in Home Assistant

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

A Home Assistant add-on that runs [CLIProxyAPI](https://github.com/router-for-me/CLIProxyAPI) - a proxy service that allows you to use AI services like OpenAI ChatGPT, Claude, Gemini, and others through a unified API endpoint.

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fc128128%2FHACLIProxyAPI)

## Installation

1. Add this repository to your Home Assistant add-on store
2. Install the HACLIProxyAPI add-on
3. Configure the add-on with your session key (see below)
4. Start the add-on

## Configuration

### Obtaining the Session Key

Before you can use this add-on, you need to obtain a session key from your AI provider. For OpenAI, run this command on your local machine:

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

This will:
1. Start a temporary server
2. Open your browser for authentication
3. Save the session key to a file in your current directory

For other providers (Claude, Gemini, Qwen), check the [official documentation](https://help.router-for.me/docker/docker.html).

### Configuring the Add-on

1. Go to the Configuration tab in the add-on
2. Paste the entire JSON content from the session key file into the **Session Key** field
3. Save the configuration
4. Start the add-on

## Usage

Once the add-on is running, CLIProxyAPI will be available at:

```
http://homeassistant.local:8787/v1
```

You can now use this endpoint in your applications or integrations to access AI services through the proxy.

### Example API Request

```bash
curl -X POST http://homeassistant.local:8787/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gpt-4",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
```

## Support

- [CLIProxyAPI GitHub](https://github.com/router-for-me/CLIProxyAPI)
- [CLIProxyAPI Documentation](https://help.router-for.me/)
- [Report Issues](https://github.com/c128128/HACLIProxyAPI/issues)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

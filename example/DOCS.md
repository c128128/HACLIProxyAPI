# Home Assistant Add-on: HACLIProxyAPI

## Installation

1. Add this repository to your Home Assistant instance
2. Install the "HACLIProxyAPI" add-on
3. Configure the add-on (see Configuration section below)
4. Start the add-on

## Configuration

Add-on configuration:

```yaml
openai_session_key: ""
log_level: info
```

### Option: `openai_session_key` (required)

The OpenAI session key for authentication. This is stored securely in `/data/auth/codex.json` inside the container.

**Note**: This field is required and must be a valid JSON string containing your authentication credentials.

### Option: `log_level`

The log level for the add-on. Options include:
- `debug`: Detailed debugging information
- `info`: General information (default)
- `warning`: Warning messages only
- `error`: Error messages only

Setting this to `debug` will enable verbose logging and pass the `-debug` flag to CLIProxyAPI.

## How to use

1. Configure your `openai_session_key` in the add-on configuration
2. Start the add-on
3. The API will be available on port 8787
4. Access the API at `http://homeassistant.local:8787` (or your Home Assistant IP)

## Support

For issues related to this add-on, please open an issue on the [GitHub repository](https://github.com/c128128/HACLIProxyAPI).

For issues with CLIProxyAPI itself, see the [upstream project](https://github.com/router-for-me/CLIProxyAPI).

# Changelog

## 1.0.20

- Fixed docker command to use official documentation command (simplified to direct --codex-login call with only port 1455)

## 1.0.19

- Updated docker command with all required ports from official docker-compose.yml

## 1.0.18

- Reverted to original docker command with full server setup

## 1.0.17

- Fixed docker command to match official documentation (simplified to direct -codex-login call)

## 1.0.16

- Added --rm flag to docker command for automatic container cleanup (keeping original command structure)

## 1.0.15

- Simplified docker command with --rm flag for automatic container cleanup

## 1.0.14

- Finalized plain text description (addon configs don't support markdown/HTML links)

## 1.0.13

- Testing markdown link syntax in description (similar to integration config flows)

## 1.0.12

- Added addon URL link to GitHub repository for easy access to documentation

## 1.0.11

- Added multiline description with docker command directly in Configuration UI

## 1.0.10

- Reverted to plain text description (HTML not supported in Configuration UI)

## 1.0.9

- Testing HTML anchor tag in session_key description

## 1.0.8

- Simplified session_key description to reference Documentation tab (links not supported in Config UI)

## 1.0.7

- Added clickable documentation link in Configuration UI for session_key instructions

## 1.0.6

- Updated docker run command with full server setup and codex-login workflow

## 1.0.5

- Updated docker run command to use volume mount and output JSON directly

## 1.0.4

- Updated session_key description with docker run command instructions

## 1.0.3

- Added translation file for configuration UI descriptions

## 1.0.2

- Fixed `session_key` to be required field

## 1.0.1

- Renamed `openai_session_key` to `session_key` for better clarity
- Added field descriptions for improved user experience

## 1.0.0

- Initial release
- Support for aarch64, amd64, armhf, armv7, and i386 architectures
- Configurable OpenAI session key authentication
- Configurable log levels (debug, info, warning, error)
- CLIProxyAPI running on port 8787
- Automatic auth file creation and validation

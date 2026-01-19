# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## Project Overview

This is a Home Assistant Add-on repository for CLIProxyAPI. It follows the Home Assistant add-on development structure and uses the official Home Assistant devcontainer for local development.

## Development Environment

Open this project in VSCode with the devcontainer extension. The devcontainer provides a full Home Assistant Supervisor environment for testing add-ons.

**Ports exposed:**
- `7123` → Home Assistant UI (internal 8123)
- `7357` → Observer (internal 4357)

## Development Commands

VSCode tasks are configured for add-on development (access via `Cmd+Shift+P` → "Tasks: Run Task"):

- **Start Home Assistant**: `supervisor_run` - Starts the HA Supervisor environment
- **Start Addon**: Stops, starts, and tails logs for an add-on
- **Rebuild and Start Addon**: Rebuilds, starts, and tails logs for an add-on

Manual CLI commands inside devcontainer:
```bash
ha addons rebuild --force "local_<addon_name>"
ha addons start "local_<addon_name>"
ha addons stop "local_<addon_name>"
docker logs --follow "addon_local_<addon_name>"
```

## Add-on Structure

Each add-on is a directory containing:
- `config.yaml` - Add-on configuration (name, version, options, schema, architectures)
- `build.yaml` - Build configuration (base images per architecture, labels)
- `Dockerfile` - Build instructions
- `rootfs/` - Files copied into container root filesystem
  - `etc/services.d/<service>/run` - s6-overlay service start script
  - `etc/services.d/<service>/finish` - s6-overlay service stop handler
  - `usr/bin/` - Custom binaries/scripts

## CI/CD

**Linting** (`.github/workflows/lint.yaml`): Runs on push/PR to main and daily. Uses `frenck/action-addon-linter`.

**Building** (`.github/workflows/builder.yaml`): Runs on push/PR to main. Only builds add-ons with changes in monitored files (`build.yaml`, `config.yaml`, `Dockerfile`, `rootfs`). Builds for `aarch64` and `amd64` architectures. Pushes to GHCR on merge to main.

## Adding a New Add-on

1. Create a new directory at repository root with the add-on slug name
2. Add required files: `config.yaml`, `build.yaml`, `Dockerfile`
3. Create service scripts in `rootfs/etc/services.d/<slug>/`
4. Update `.vscode/tasks.json` to add the add-on slug to the `addonName` options list

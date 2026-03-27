#!/bin/bash
# Wrapper script to run the MCP server from npm package
set -e
export SERVICENOW_INSTANCE_URL="${SERVICENOW_INSTANCE_URL:-https://dev12345.service-now.com}"
export SERVICENOW_AUTH_METHOD="${SERVICENOW_AUTH_METHOD:-basic}"
export SERVICENOW_BASIC_USERNAME="${SERVICENOW_BASIC_USERNAME:-admin}"
export SERVICENOW_BASIC_PASSWORD="${SERVICENOW_BASIC_PASSWORD:-test_password_123}"
export WRITE_ENABLED="${WRITE_ENABLED:-false}"
export SCRIPTING_ENABLED="${SCRIPTING_ENABLED:-false}"

# Get the package directory and run the server
PACKAGE_DIR=$(npm root -g)/@iflow-mcp/aartiq-nowaikit
if [ ! -d "$PACKAGE_DIR" ]; then
    # If not installed globally, install it first
    npx -y @iflow-mcp/aartiq-nowaikit --version >/dev/null 2>&1
    PACKAGE_DIR=$(npm root -g)/@iflow-mcp/aartiq-nowaikit
fi

exec node "$PACKAGE_DIR/dist/server.js"

#!/usr/bin/env bash

# ~~~~~~~~~~ Python Functions ~~~~~~~~~~

# Start the python simple http server
# arg1:
function py-serve() {
    local -r PORT=${1:-8888}
    python -m http.server "$PORT"
}

# Python pip Global Install
function py-pip-global-install() {
    PIP_REQUIRE_VIRTUALENV=false pip "$@"
}

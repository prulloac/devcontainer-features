#!/bin/bash

set -e

source dev-container-features-test-lib

check "validate bun installation" bun --version | grep '1'
check "validate npm installation" which npm | grep '/bin/npm'
check "validate devcontainer cli installation" which devcontainer | grep '/bin/devcontainer'

reportResults
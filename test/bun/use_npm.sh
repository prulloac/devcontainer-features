#!/bin/bash

set -e

source dev-container-features-test-lib

check "validate bun installation" bun --version | grep '1'
check "validate npm installation" npm --version | grep '1'

reportResults
#!/bin/bash

set -e

source dev-container-features-test-lib

check "validate commitizen installation" cz version | grep '3'

reportResults
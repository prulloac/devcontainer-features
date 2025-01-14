#!/bin/bash

set -e

source dev-container-features-test-lib

check "validate lua installation" lua -v

reportResults
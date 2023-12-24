#!/bin/bash

set -e

source dev-container-features-test-lib

check "validate pre-commit installation" gitlint --version | grep 'gitlint'

reportResults
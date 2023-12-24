#!/bin/bash

set -e

source dev-container-features-test-lib

check "validate gitlint installation" gitlint --version | grep 'gitlint'
check "validate hook installation" cat $PWD/.git/hooks/commit-msg | grep 'pre-commit'

reportResults
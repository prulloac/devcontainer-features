#!/bin/bash

set -e

source dev-container-features-test-lib

check "validate chezmoi installation" chezmoi --version | grep '2'

reportResults
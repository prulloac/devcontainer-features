#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'color' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "color": {}
#    },
#    "remoteUser": "root"
# }
#
# Thus, the value of all options will fall back to the default value in the
# Feature's 'devcontainer-feature.json'.
# For the 'color' feature, that means the default favorite color is 'red'.
#
# These scripts are run as 'root' by default. Although that can be changed
# with the '--remote-user' flag.
# 
# This test can be run with the following command:
#
#    devcontainer features test    \ 
#               --features color   \
#               --remote-user root \
#               --skip-scenarios   \
#               --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#               /path/to/this/repo

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]

check "validate tlmgr installation" tlmgr --version | grep 'TeX Live'
check "validate latex installation" latex --version | grep 'TeX Live'
check "validate latexmk installation" latexmk -v | grep 'Latexmk'
check "validate chktex installation" chktex --version | grep 'chktex'
check "validate babel-german installation" tlmgr info --only-installed | grep 'babel-german'
check "validate babel-french installation" tlmgr info --only-installed | grep 'babel-french'

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
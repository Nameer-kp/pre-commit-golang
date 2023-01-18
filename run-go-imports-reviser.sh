#!/usr/bin/env bash
#
# Capture and print stdout, since goimports doesn't use proper exit codes
#
set -e -o pipefail

if ! command -v goimports-reviser &> /dev/null ; then
    echo "goimports-reviser not installed or available in the PATH" >&2
    echo "run go install -v github.com/incu6us/goimports-reviser/v3@latest" >&2
    exit 1
fi

output="$(goimports-reviser -format -rm-unused "$@")"
echo "$output"
[[ -z "$output" ]]
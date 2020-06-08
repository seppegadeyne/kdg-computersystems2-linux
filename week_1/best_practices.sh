#!/bin/bash
# Function:       Best practices how to setup your bash script
#                 See below the important steps
# Arguments:      Arg1 is a string
# Author:         seppe.gadeyne@student.kdg.be
# Copyright:      2020, seppe.gadeyne@student.kdg.be
# Version:        0.0.1
# Requires:       Standard shell find commando

# Steps to follow:
# ------------------------------------------------------------------
# 1. Arguments and --help
# 2. Input validation
# 3. Exit code 0 and 1
# 4. Environment variables in capital; command "env"
# 5. Own variables in lowercase_with_underscore
# 6. Add extra comments
# 7. Send errors to STDERRi
# 8. Errors contain $0 (name script)
# 9. Check returns from last executed commands with $?
# 10. Check dependencies [[ -x "$(command -v cwebp)" ]]

[[ $(id -u) -ne 0 ]] && { echo "Run this script as root" >&2; exit 1; }

[[ $# -lt 1 || "$1" = "--help" ]] && {
  echo "Usage: $(basename "$0") arg1"
  echo "Example: $(basename "$0") Hello"
  exit 1
}

echo "First argument is $1"
exit 0

#!/usr/bin/env bash

PROMPT="===>"
CLEARCOLOR="\033[0m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
LOGFILE=$(mktemp)

fail() {
  echo -e "${RED} $1${CLEARCOLOR}"
  exit -1
}

task_inform() {
  echo -e "${GREEN}${PROMPT} $1${CLEARCOLOR}"
}

clear_previous_line() {
  tput cuu 1 && tput el
}

# Don't complain about echo -e not expanding escape sequences since macOS's
# implementation of echo -e does
# shellcheck disable=2028
subtask_inform() {
  echo -e "\t ${YELLOW}$1${CLEARCOLOR}"
}

# shellcheck disable=2028
subtask_success() {
  clear_previous_line
  echo -e "\t✅  ${GREEN}$1${CLEARCOLOR}"
}

# shellcheck disable=2028
subtask_fail(){
  clear_previous_line
  echo -e "\t❌  ${RED}$1${CLEARCOLOR}"
}

subtask_exec() {
  echo -e "Starting subtask with log string: $1" >> "$LOGFILE" 2>&1
  subtask_inform "$1"
  ${*:2} >> "$LOGFILE" 2>&1

  if [ "$?" -eq 0 ]; then
    subtask_success "$1"
  else
    subtask_fail "$1"
    fail "Command ${*:2} failed. Check $LOGFILE for more info"
  fi
}

#!/usr/bin/env bash
export PLAYBOOKS_DIR=playbooks

bash setup.sh
puppet debugger
bash

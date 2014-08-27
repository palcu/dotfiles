#!/usr/bin/env bash

if [[ `uname` == 'Linux' ]]; then
  ansible-playbook -i inventory ubuntu.yml
else
  ansible-playbook -i inventory osx.yml
fi

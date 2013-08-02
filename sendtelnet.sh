#!/bin/bash

# EDIT HERE
tip="192.168.1.1"
tuser="root"
tpass="123123123"
command="show run"
# EDIT HERE

expect << EOF
  set timeout 10
  spawn telnet $tip
  expect "Username:"
    send "$tuser\r"
  expect "Password:"
    send "$tpass\r"
  expect "#"
    send "$command\r"
EOF

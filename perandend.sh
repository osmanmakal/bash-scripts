#!/bin/bash
if [[ -n $1 ]] && [[ -n $2 ]] && [[ -n $3 ]];then
  echo -n "What is added to the text? :"
  read ekle
  echo
 else
  echo "invalid option!"
  echo "p : per of the line"
  echo "b : end of the line"
  echo "Sample : sh perandend.sh p text.txt output.txt"
  echo "or"
  echo "Sample : sh perandend.sh b text.txt output.txt"
  exit 0
fi

if [ "$1" = "p" ]; then
  for i in $(cat $2); do echo "$ekle $i";done > $3
  echo "$3 File created"
elif [ "$1" = "b" ]; then
  for i in $(cat $2); do echo "$i $ekle";done > $3
  echo "$3 File created"
else
  echo "invalid option!"
  echo "p : per of the line"
  echo "b : end of the line"
  echo "Sample : sh perandend.sh p text.txt output.txt"
  echo "or"
  echo "Sample : sh perandend.sh b text.txt output.txt"
  exit 0
fi

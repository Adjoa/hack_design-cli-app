#!/bin/bash
# get-lessons.sh
typeset -i i END
let END=50 i=8
while ((i<=END)); do
  echo "Script starting now..."
  curl https://hackdesign.org/lessons/$i -O
  let i++
done
echo "Done."

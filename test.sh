#!/bin/bash

CPPFILE=$1
TESTCASE=$2
ANSFILE=$3
OBJFILE="${CPPFILE%.*}"

g++ $CPPFILE -o $OBJFILE


correct=0
count=0

if [ $? -ne 0 ]
then
   echo "Wrong Submission" && ./$OBJFILE
else
   ./$OBJFILE < $TESTCASE > "out.txt"

   while read -u 3 -r line1 && read -u 4 -r line2; do
      ((count++))
      if [ $line1 == $line2 ]
      then
	 ((correct++))
      fi
   done 3<$ANSFILE 4<"out.txt"
fi

echo "Correct cases: $correct"
let "val=$count-$correct"
echo "Wrong cases: $val"

if [ $correct -eq $count ]
then
    echo "Successful Submission"
else
    echo "Wrong Submission"
fi

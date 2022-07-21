#!/bin/bash

CPPFILE=$1
TESTCASE=$2
ANSFILE=$3
OBJFILE="${CPPFILE%.*}"

g++ $CPPFILE -o $OBJFILE    

RETVAL=$?
correct=0
count=0
RUNERR=0

if [ $RETVAL -ne 0 ]
then
   echo "Compilation Error"
else
	timeout 5 ./$OBJFILE < $TESTCASE > "out.txt" || ((RUNERR++))
   if [ $RUNERR -eq 0 ]
   then
   	while read -u 3 -r line1 && read -u 4 -r line2; do
      		((count++))
      		if [ "$line1" == "$line2" ]
      		then
	 		((correct++))
      		fi
   	done 3<$ANSFILE 4<"out.txt"

   	echo "Correct cases: $correct"
   	let "val=$count-$correct"
   	echo "Wrong cases: $val"

   	if [ $correct -eq $count ]
   	then
      		echo "Successful Submission"
      		#echo "$mytime"
   	else
      		echo "Wrong Submission"
      		#echo "$mytime"
   	fi
   else
	echo "RunTime error"
   fi
fi

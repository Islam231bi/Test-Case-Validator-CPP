#!/bin/bash

CPPFILE=$1
TESTCASEFILE=$2
OBJFILE="${CPPFILE%.*}"

g++ $CPPFILE -o $OBJFILE


if [ $? -ne 0 ]
then
   echo "Wrong Submission" && ./$OBJFILE
else
   
fi

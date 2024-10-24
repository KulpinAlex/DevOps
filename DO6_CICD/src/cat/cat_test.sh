#!/bin/bash

COUNTER_SUCCESS=0
COUNTER_FAIL=0
COUNTER=0
DIFF_RES=""
TEST_FILE="test_file.txt"
echo "" > log.txt

for var in -b -e -n -s -t -v
do
          TEST1="$var $TEST_FILE"
          ./s21_cat $TEST1 > s21_cat.txt
          cat $TEST1 > cat.txt
          DIFF_RES="$(diff -s s21_cat.txt cat.txt)"
          (( COUNTER++ ))
          if [ "$DIFF_RES" == "Files s21_cat.txt and cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: cat $TEST1"
            else
              echo "$TEST1" >> log.txt
              (( COUNTER_FAIL++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: cat $TEST1"
              exit 1
	  fi
          rm s21_cat.txt cat.txt
done

for var in -b -e -n -s -t -v
do
  for var2 in -b -e -n -s -t -v
  do
        if [ $var != $var2 ]
        then
          TEST1="$var $var2 $TEST_FILE"
          ./s21_cat $TEST1 > s21_cat.txt
          cat $TEST1 > cat.txt
          DIFF_RES="$(diff -s s21_cat.txt cat.txt)"
          (( COUNTER++ ))
          if [ "$DIFF_RES" == "Files s21_cat.txt and cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER sucess: cat $TEST1"
            else
              echo "$TEST1" >> log.txt
              (( COUNTER_FAIL++ ))
              echo "$COUNTER_FAIL/$COUNTER_SUCCESS/$COUNTER failed: cat $TEST1"
	      exit 1
          fi
          rm s21_cat.txt cat.txt
        fi
  done
done
rm log.txt
echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"

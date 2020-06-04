#!/bin/bash -x
echo "Welcome to flip Coin Simulation"

declare -A singlet
singlet=([H]=0 [T]=0)
function single(){
echo "***************Singlet******************"
   while [ ${singlet[H]} -ne 15 -a ${singlet[H]} -ne 15 ]
   do
      local num1=$((RANDOM%2))
            if [ $num1 -eq 0 ]
            then
         singlet[T]=$((singlet[T] + 1))
            else
         singlet[H]=$((singlet[H] + 1))
            fi
   done
echo "${singlet[@]} | total = $((singlet[H] + singlet[T]))"
echo "H % = $(( (singlet[H] * 100 )/ (singlet[H] + singlet[T]) ))"
echo "T % = $(( (singlet[T] * 100 )/ (singlet[H] + singlet[T]) ))"
}
single

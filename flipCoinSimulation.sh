#!/bin/bash -x
echo "Welcome to flip Coin Simulation"

declare -A singlet
declare -A doublet

singlet=([H]=0 [T]=0)
doublet=([HH]=0 [HT]=0 [TH]=0 [TT]=0)

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

function double() {
echo "********************Doublet*******************"
while [ ${doublet[HH]} -ne 15 -a ${doublet[HT]} -ne 15 -a ${doublet[TH]} -ne 15 -a ${doublet[TT]} -ne 15 ]
   do
      local num1=$((RANDOM%2))
      local num2=$((RANDOM%2))
            if [ $num1 -eq 0 -a $num2 -eq 0 ]
            then
               doublet[TT]=$((doublet[TT] + 1))
            elif [ $num1 -eq 0 -a $num2 -eq 1 ]
            then
               doublet[TH]=$((doublet[TH] + 1))
            elif [ $num1 -eq 1 -a $num2 -eq 0 ]
            then
               doublet[HT]=$((doublet[HT] + 1))
            elif [ $num1 -eq 1 -a $num2 -eq 1 ]
            then
               doublet[HH]=$((doublet[HH] + 1))
            fi
   done
dtotal=$((doublet[HH] + doublet[HT] + doublet[TH] + doublet[TT]))
echo "${doublet[@]} | total = $dtotal"
echo "HH % = $(( (${doublet[HH]} * 100 ) / $dtotal ))"
echo "HT % = $(( (${doublet[HT]} * 100 ) / $dtotal))"
echo "TH % = $(( (${doublet[TH]} * 100 ) / $dtotal))"
echo "TT % = $(( (${doublet[TT]} * 100 ) / $dtotal))"
}

single
double

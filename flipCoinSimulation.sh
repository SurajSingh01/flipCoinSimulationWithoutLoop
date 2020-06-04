#!/bin/bash -x
echo "Welcome to flip Coin Simulation"

declare -A singlet
declare -A doublet
declare -A triplet

singlet=([H]=0 [T]=0)
doublet=([HH]=0 [HT]=0 [TH]=0 [TT]=0)
triplet=([HHH]=0 [HHT]=0 [HTH]=0 [THH]=0 [TTH]=0 [THT]=0 [HTT]=0 [TTT]=0)

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

function triple() {
echo "******************Triplet*******************"
while [ ${triplet[HHH]} -ne 15 -a ${triplet[HHT]} -ne 15 -a ${triplet[HTH]} -ne 15 -a ${triplet[THH]} -ne 15  -a ${triplet[TTH]} -ne 15  -a ${triplet[THT]} -ne 15  -a ${triplet[HTT]} -ne 1>
   do
   local num1=$((RANDOM%2))
   local num2=$((RANDOM%2))
   local num3=$((RANDOM%2))
      if [ $num1 -eq 0 -a $num2 -eq 0 -a $num3 -eq 0 ]
      then
         triplet[TTT]=$((triplet[TTT] + 1))
      elif [ $num1 -eq 1 -a $num2 -eq 0 -a $num3 -eq 0 ]
      then
         triplet[HTT]=$((triplet[HTT] + 1))
      elif [ $num1 -eq 0 -a $num2 -eq 1 -a $num3 -eq 0 ]
      then
         triplet[THT]=$((triplet[THT] + 1))
      elif [ $num1 -eq 0 -a $num2 -eq 0 -a $num3 -eq 1 ]
      then
         triplet[TTH]=$((triplet[TTH] + 1))
      elif [ $num1 -eq 0 -a $num2 -eq 1 -a $num3 -eq 1 ]
      then
         triplet[THH]=$((triplet[THH] + 1))
      elif [ $num1 -eq 1 -a $num2 -eq 0 -a $num3 -eq 1 ]
      then
         triplet[HTH]=$((triplet[HTH] + 1))
      elif [ $num1 -eq 1 -a $num2 -eq 1 -a $num3 -eq 0 ]
      then
         triplet[HHT]=$((triplet[HHT] + 1))
      elif [ $num1 -eq 1 -a $num2 -eq 1 -a $num3 -eq 1 ]
      then
         triplet[HHH]=$((triplet[HHH] + 1))
      fi
   done
ttotal=$((triplet[HHH] + triplet[HHT] + triplet[HTH] + triplet[THH] + triplet[TTH] + triplet[THT] + triplet[HTT] + triplet[TTT]))
echo "${triplet[@]} | total = $ttotal"
echo "HHH % = $(( (${triplet[HHH]} * 100 ) / $ttotal))"
echo "HHT % = $(( (${triplet[HHT]} * 100 ) / $ttotal))"
echo "HTH % = $(( (${triplet[HTH]} * 100 ) / $ttotal))"
echo "THH % = $(( (${triplet[THH]} * 100 ) / $ttotal))"
echo "TTH % = $(( (${triplet[TTH]} * 100 ) / $ttotal))"
echo "THT % = $(( (${triplet[THT]} * 100 ) / $ttotal))"
echo "HTT % = $(( (${triplet[HTT]} * 100 ) / $ttotal))"
echo "TTT % = $(( (${triplet[TTT]} * 100 ) / $ttotal))"
}

single
double
triple

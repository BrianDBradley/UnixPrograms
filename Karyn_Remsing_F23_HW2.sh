# NAME: Brian Bradley
# CS4350 - Unix Systems Programming
# Section Number: 001
# Assignment Number: 2
# Due Date: 9 / 18/ 2023 no later than 5:15 pm
echo ""
echo ""
echo ""
echo "This Script is Designed and Implemented by Karyn Remsing"
echo ""
echo "The function of This script is to:"
echo ""
echo "1. Display the integer arguments that are entered."
echo "2. Display the smallest of the integer arguments."
echo "3. Display the largest of the integer arguments."
echo "4. Sum of the 3 integer arguments."
echo "5. Product of the 3 integer arguments."
echo "6. Average of the 4 integer arguments."
echo "7. Square of each integer argument."
echo "8. Determine that each integer argument is postive, negative, or zero."
echo "9. Determine that each integer argument is odd, or even."
echo "10. Find all even numbers between 1 and the first integer argument."
echo "11. Find all odd numbers between 1 and the third integer argument."
echo "12. Find the factorial of the last integer argument."
echo "13. Determine whether or not the second integer argument is a prime number."
echo "14. Calculating Distinct Sequence of the second integer."
echo ""
echo -n "Enter 3 integer Values - - - - > " 
read int1 int2 int3
echo ""
echo ""
# Check for 3 intgers
if [ -z "$int1" ] || [ -z "$int2" ] || [ -z "$int3" ]; then
    echo " **** Error - Must input 3 integer Values"
	echo "End of Script"
	echo "Karyn Remsing - 9 - 18 - 2023"
	exit 0
else
    echo -e "1) You Entered    $int1    $int2    $int3"
    echo ""
fi


# Initialize variables
smallest=$int1
largest=$int1
sum=0
product=1
factorial=1                                                                                                                                                                     


# Find Smallest and Largest
# -lt: less than   -gt: greater than
if [ "$int2" -lt "$smallest" ]; then 
	smallest=$int2
fi
if [ "$int2" -gt "$largest" ]; then 
	largest=$int2
fi

if [ "$int3" -lt "$smallest" ]; then 
	smallest=$int3
fi
if [ "$int3" -gt "$largest" ]; then 
	largest=$int3
fi

echo "2) The Smallest integer is $smallest"
echo ""
echo "3) The largest integer is $largest"
echo ""

# Store squares of arguments
declare -a squares=()
# Store pos, neg, or zero for each arg
declare -a posOrNeg=()
# Store odd or even for each arg
declare -a oddOrEven=()
# Store even numbers to first int
declare -a evens=()

# Loop through arguments
for var in "$int1" "$int2" "$int3";
do
	# Sum arguments
	sum=$(($sum+$var))
	# Product of arguments
	product=$(($product*$var))

	# Fill array with squares of arguments
	squares+=($(($var * $var)))
	
	# Determine if positive, negative, or zero
	if [ $var -gt 0 ]
	then
		posOrNeg+=("positive")
	elif [ $var -lt 0 ]
	then
		posOrNeg+=("negative")
	elif [ $var -eq 0 ]
	then
		posOrNeg+=("zero")
	fi

	# Determine if odd or even
	if [[ $(($var % 2)) -eq 0 ]]
	then
		oddOrEven+=("Even")
	else
		oddOrEven+=("Odd")
	fi
done

#Print results
echo "4) $int1 + $int2 + $int3 = $sum"
echo ""
echo "5) $int1 * $int2 * $int3 = $product"
echo ""
avg=$(($sum / 3))
echo "6) ($int1 + $int2 + $int3)/3 = $avg"
echo ""
echo "7) $int1*$int1 = ${squares[0]}, $int2*$int2 = ${squares[1]}, $int3*$int3 = ${squares[2]}"
echo ""

# I switched the echos to printfs because -n was not working.
# Feel free to switch it back if that works fine in TXSTs zeus environment
for i in {1..3}
do
	if [ "$i" -eq 1 ]; then
		echo -n "8) $int1 is ${posOrNeg[$i-1]},"
	elif [ "$i" -eq 2 ]; then
		echo -n " $int2 is ${posOrNeg[$i-1]},"
	elif [ "$i" -eq 3 ]; then
		echo " $int3 is ${posOrNeg[$i-1]}."
	fi
done

echo ""

# Print odd or even
for i in {1..3}
do
	if [ "$i" -eq 1 ]; then
		echo -n "9) $int1 is ${oddOrEven[$i-1]},"
	elif [ "$i" -eq 2 ]; then
		echo -n " $int2 is ${oddOrEven[$i-1]},"
	elif [ "$i" -eq 3 ]; then
		echo " $int3 is ${oddOrEven[$i-1]}."
	fi
done
echo ""

# 10) Evens
if [ $int1 -lt 0 ]; then
	for((i=$(($int1+1));i<1;i++)); do
		if ((i % 2 == 0)); then
			evens+=("$i ")
		fi
	done
elif [ $int1 -gt 0 ]; then
	for((i=2;i<$int1;i++)); do
		if ((i % 2 == 0)); then
			evens+=("$i ")
		fi
	done
fi
echo -n "10) All even numbers between 1 and $int1 are: "
for einteger in "${evens[@]}"; do
	echo -n "$einteger "
done
echo ""
echo ""

# 11) Odds
if [ $int3 -lt 0 ]; then
	for((i=$(($int3+1));i<1;i++)); do
		if ((i % 2 != 0)); then
			odds+=("$i ")
		fi
	done
elif [ $int3 -gt 0 ]; then
	for((i=2;i<$int3;i++)); do
		if ((i % 2 != 0)); then
			odds+=("$i ")
		fi
	done
fi
echo -n "11) All odd numbers between 1 and $int3 are: "
for ointeger in "${odds[@]}"; do
	echo -n "$ointeger"
done
echo ""
echo ""

# 12) Factorial
for ((i=1; i<=$int3; i++)); do
        factorial=$(($factorial * $i))
done
echo "12) Factorial of $int3 is: $factorial"
echo ""

# 13) Prime Function
primeOrNot=""
if [ $int2 -le 1 ]; then
	primeOrNot+="not prime."
else
	for ((i=2; $i*$i<=$int2; i++)) do
		if [ $(($int2 % i)) -eq 0 ]; then
			primeOrNot+="not prime."
			break
		else
			primeOrNot+="prime."
			break
		fi

	done
fi
echo "13) $int2 is $primeOrNot"
echo ""

#14) Distinct Sequence?
echo -n "14) Distinct sequence for the integer $int2 is : "
echo -n "$int2 "
while [ $int2 -ne 1 ]
do
	if [ $int2 -le 0 ]
	then
		echo ""
		echo "$int2 is not positive. Therefore, there is no distinct sequence for $int2"
		int2=1
	elif (($int2 % 2 == 0));
	then
		int2=$(($int2 / 2))
		echo -n "$int2 "
	else
		int2=$(($int2 * 3 + 1))
		echo -n "$int2 "
	fi
done

echo ""
echo ""

echo "End of Script"
echo ""
echo "Karyn Remsing - 9 - 18 - 2023"

exit 0




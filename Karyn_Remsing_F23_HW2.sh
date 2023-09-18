# NAME: Karyn Remsing
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
echo "6. Average of the 3 integer arguments."
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
read -a ints
echo ""
echo ""
# Check for 3 intgers
if [ ${#ints[@]} -ne 3 ]; then
    echo " **** Error - Must input 3 integer Values"
	echo "End of Script"
	echo "Karyn Remsing - 9 - 18 - 2023"
	exit 0
else
    echo -e "1) You Entered    ${ints[0]}    ${ints[1]}    ${ints[2]}"
    echo ""
fi


# Initialize variables
smallest=${ints[0]}
largest=${ints[0]}
sum=0
product=1
factorial=1                                                                                                                                                                     


# Find Smallest and Largest
# -lt: less than   -gt: greater than
if [ "${ints[1]}" -lt "$smallest" ]; then 
	smallest=${ints[1]}
fi
if [ "${ints[1]}" -gt "$largest" ]; then 
	largest=${ints[1]}
fi

if [ "${ints[2]}" -lt "$smallest" ]; then 
	smallest=${ints[2]}
fi
if [ "${ints[2]}" -gt "$largest" ]; then 
	largest=${ints[2]}
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
for var in "${ints[@]}";
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
echo "4) ${ints[0]} + ${ints[1]} + ${ints[2]} = $sum"
echo ""
echo "5) ${ints[0]} * ${ints[1]} * ${ints[2]} = $product"
echo ""
avg=$(($sum / 3))
echo "6) (${ints[0]} + ${ints[1]} + ${ints[2]})/3 = $avg"
echo ""
echo "7) ${ints[0]}*${ints[0]} = ${squares[0]}, ${ints[1]}*${ints[1]} = ${squares[1]}, ${ints[2]}*${ints[2]} = ${squares[2]}"
echo ""

# I switched the echos to printfs because -n was not working.
# Feel free to switch it back if that works fine in TXSTs zeus environment
for i in {1..3}
do
	if [ "$i" -eq 1 ]; then
		echo -n "8) ${ints[0]} is ${posOrNeg[$i-1]},"
	elif [ "$i" -eq 2 ]; then
		echo -n " ${ints[1]} is ${posOrNeg[$i-1]},"
	elif [ "$i" -eq 3 ]; then
		echo " ${ints[2]} is ${posOrNeg[$i-1]}."
	fi
done

echo ""

# Print odd or even
for i in {1..3}
do
	if [ "$i" -eq 1 ]; then
		echo -n "9) ${ints[0]} is ${oddOrEven[$i-1]},"
	elif [ "$i" -eq 2 ]; then
		echo -n " ${ints[1]} is ${oddOrEven[$i-1]},"
	elif [ "$i" -eq 3 ]; then
		echo " ${ints[2]} is ${oddOrEven[$i-1]}."
	fi
done
echo ""

# 10) Evens
if [ ${ints[0]} -lt 0 ]; then
	for((i=$((${ints[0]}+1));i<1;i++)); do
		if ((i % 2 == 0)); then
			evens+=("$i ")
		fi
	done
elif [ ${ints[0]} -gt 0 ]; then
	for((i=2;i<${ints[0]};i++)); do
		if ((i % 2 == 0)); then
			evens+=("$i ")
		fi
	done
fi
echo -n "10) All even numbers between 1 and ${ints[0]} are: "
for einteger in "${evens[@]}"; do
	echo -n "$einteger "
done
echo ""
echo ""

# 11) Odds
if [ ${ints[2]} -lt 0 ]; then
	for((i=$((${ints[2]}+1));i<1;i++)); do
		if ((i % 2 != 0)); then
			odds+=("$i ")
		fi
	done
elif [ ${ints[2]} -gt 0 ]; then
	for((i=2;i<${ints[2]};i++)); do
		if ((i % 2 != 0)); then
			odds+=("$i ")
		fi
	done
fi
echo -n "11) All odd numbers between 1 and ${ints[2]} are: "
for ointeger in "${odds[@]}"; do
	echo -n "$ointeger"
done
echo ""
echo ""

# 12) Factorial
for ((i=1; i<=${ints[2]}; i++)); do
        factorial=$(($factorial * $i))
done
echo "12) Factorial of ${ints[2]} is: $factorial"
echo ""

# 13) Prime Function
primeOrNot=""
if [ ${ints[1]} -le 1 ]; then
	primeOrNot+="not prime."
else
	for ((i=2; $i*$i<=${ints[1]}; i++)) do
		if [ $((${ints[1]} % i)) -eq 0 ]; then
			primeOrNot+="not prime."
			break
		else
			primeOrNot+="prime."
			break
		fi

	done
fi
echo "13) ${ints[1]} is $primeOrNot"
echo ""

#14) Distinct Sequence?
echo -n "14) Distinct sequence for the integer ${ints[1]} is : "
echo -n "${ints[1]} "
while [ ${ints[1]} -ne 1 ]
do
	if [ ${ints[1]} -le 0 ]
	then
		echo ""
		echo "${ints[1]} is not positive. Therefore, there is no distinct sequence for ${ints[1]}"
		ints[1]=1
	elif ((${ints[1]} % 2 == 0));
	then
		ints[1]=$((${ints[1]} / 2))
		echo -n "${ints[1]} "
	else
		ints[1]=$((${ints[1]} * 3 + 1))
		echo -n "${ints[1]} "
	fi
done

echo ""
echo ""

echo "End of Script"
echo ""
echo "Karyn Remsing - 9 - 18 - 2023"

exit 0




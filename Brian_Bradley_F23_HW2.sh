# NAME: Brian Bradley
# CS4350 - Unix Systems Programming
# Section Number: 001
# Assignment Number: 2
# Due Date: 9 / 18/ 2023 no later than 5:15 pm


echo "Enter 3 integer Values - - - - >" 
read int1 int2 int3
# Check for 3 intgers
if [ -z "$int1" ] || [ -z "$int2" ] || [ -z "$int3" ]; then
    echo " **** Error - Must input 3 integer Values"
	echo "\n\nEnd of Script"
	echo "\nBrian Bradley - 9 - 18 - 2023"
	exit 0
else
    echo -e "\n\n1) You Entered    $int1    $int2    $int3"
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

echo "\n2) The Smallest integer is $smallest"
echo "\n3) The largest integers is $largest"

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
echo "\n4) $int1 + $int2 + $int3 = $sum"
echo "\n5) $int1 * $int2 * $int3 = $product"
avg=$(($sum / 3))
echo "\n6) ($int1 + $int2 + $int3)/3 = $avg"
echo "\n7) $int1*$int1 = ${squares[0]}, $int2*$int2 = ${squares[1]}, $int3*$int3 = ${squares[2]}"

# I switched the echos to printfs because -n was not working.
# Feel free to switch it back if that works fine in TXSTs zeus environment
for i in {1..3}
do
	if [ "$i" -eq 1 ]; then
		printf "\n8) $int1 is ${@:$i:1} ${posOrNeg[$i-1]},"
	elif [ "$i" -eq 2 ]; then
		printf " $int2 is ${@:$i:1} ${posOrNeg[$i-1]},"
	elif [ "$i" -eq 3 ]; then
		printf " $int3 is ${@:$i:1} ${posOrNeg[$i-1]}."
	fi
done

# Print odd or even
for i in {1..3}
do
	if [ "$i" -eq 1 ]; then
		printf "\n\n9) $int1 is ${@:$i:1} ${oddOrEven[$i-1]},"
	elif [ "$i" -eq 2 ]; then
		printf " $int2 is ${@:$i:1} ${oddOrEven[$i-1]},"
	elif [ "$i" -eq 3 ]; then
		printf " $int3 is ${@:$i:1} ${oddOrEven[$i-1]}."
	fi
done

# 10) Evens
for ((i=1; i<$int1; i++)); do
    if ((i % 2 == 0)); then
        evens+=("$i ")
    fi
done
echo "\n\n10) All even numbers between 1 and $int1 are: "
for einteger in "${evens[@]}"; do
	printf "$einteger"
done

# 11) Odds
for ((i=1; i<$int3; i++)); do
    if ((i % 2 == 1)); then
        odds+=("$i ")
    fi
done
echo "\n\n11) All odd numbers between 1 and $int3 are: "
for ointeger in "${odds[@]}"; do
	printf "$ointeger"
done

# 12) Factorial
for ((i=1; i<=$int3; i++)); do
        factorial=$(($factorial * $i))
done
echo "\n\n12) Factorial of $int3 is: $factorial"

# 13) Prime Function
is_prime() {
	local int=$1				# First argument passed
	if [ $int -le 1 ]; then
		return 1				# Is not Prime
	fi
	for ((i=2; i*i<=$int; i++)) do
		if [ $((int % i)) -eq 0 ]; then
			return 1
		fi
	done
	return 0 					# Is a prime
}
if is_prime "$int2"; then
	echo "\n13) $int2 is prime"
else
	echo "\n13) $int2 is not prime"
fi

#14) Distinct Sequence?
# TODO
echo "\n14) TODO! What the heck is a distinct sequence?"

echo "\n\nEnd of Script"
echo "\nBrian Bradley - 9 - 18 - 2023"

exit 0




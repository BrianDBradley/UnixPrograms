# NAME: Brian Bradley
# CS4350 - Unix Systems Programming
# Section Number: 001
# Assignment Number: 2
# Due Date: 9 / 18/ 2023 no later than 5:15 pm

# Print the arguments
echo "$1 $2 $3"

# Print the smallest and largest arguments
smallest=$1
largest=$1
sum=0
product=1
# Store squares of arguments
declare -a squares=()
# Store pos, neg, or zero for each arg
declare -a posOrNeg=()
# Store odd or even for each arg
declare -a oddOrEven=()
# Loop through arguments
for var in "$@"
do
	# Sum arguments
	sum=$(($sum+$var))
	# Product of arguments
	product=$(($product*$var))
	# Find largest and smallest
	if [ $var -lt $smallest ]
	then
		smallest=$var
	fi

	if [ $var -gt $largest ]
	then
		largest=$var
	fi
	# Fill array with squares of arguments
	squares+=($(($var * $var)))
	
	# Determine if positive, negative, or zero
	if [ $var -gt 0 ]
	then
		posOrNeg+=("Positive")
	elif [ $var -lt 0 ]
	then
		posOrNeg+=("Negative")
	elif [ $var -eq 0 ]
	then
		posOrNeg+=("Zero")
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
echo "Smallest: $smallest"
echo "Largest: $largest"
echo "Sum: $sum"
echo "Product: $product"
avg=$(($product / $#))
echo "Average: $avg"
echo "Squares: ${squares[@]}"
# Print positive, negative, or zero
echo "Positive, Negative, or Zero: "
for i in {1..3}
do
	echo -n "${@:$i:1} : "
	echo "${posOrNeg[$i-1]}"
done
# Print odd or even
echo "Odd or Even: "
for i in {1..3}
do
	echo -n "${@:$i:1} : "
	echo "${oddOrEven[$i-1]}"
done


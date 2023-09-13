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
declare -a squares=()
declare -a posOrNeg=()
for var in "$@"
do
	sum=$(($sum+$var))
	product=$(($product*$var))
	if [ $var -lt $smallest ]
	then
		smallest=$var
	fi

	if [ $var -gt $largest ]
	then
		largest=$var
	fi
	squares+=($(($var * $var)))

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
done
echo "Smallest: $smallest"
echo "Largest: $largest"
echo "Sum: $sum"
echo "Product: $product"
avg=$(($product / $#))
echo "Average: $avg"
echo "Squares: ${squares[@]}"
# Still working on printing in format "Argument n : Pos, Neg, Or Zero. Problems 1-7 are done though"
#printf "Positive, Negative or Zero:\n %d : %s\n" ${squares[@]} ${posOrNeg[@]}

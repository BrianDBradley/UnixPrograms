# NAME: Brian Bradley
# CS4350 - Unix Systems Programming
# Section Number: 001
# Assignment Number: 2
# Due Date: 9 / 18/ 2023 no later than 5:15 pm

# Print the arguments
echo "$1 $2 $3"

# Print the smallest argument
$smallest = $1
$largest = $1
for arg in "${@}"
do
	if [$arg -lt $smallest]
		$smallest = $arg
	fi
	if [$arg -gt $largest]
		$largest = $arg
	fi
done
echo "Smallest: $smallest"
echo "Largest: $largest"

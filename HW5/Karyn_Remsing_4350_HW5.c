// NAME: Brian Bradley and Karyn Remsing
// CS 4350 - Unix Systems Programming	Section Number: 001
// Serial Number: 3 and 12
// Assignment Number: 5
// Due Date: 10 / 25 / 2023
#include <stdbool.h>
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <math.h>    // to use sqrt

bool checkPrime(int number);
void allPrimes(int number);
void squarePairs(int number);

int main()
{
    printf("\nMathematics and Computer Programming\n\n");
    printf("The program will determine whether or not the that was\n");
    printf("entered from the keyboard is prime. Also, the program will find all\n");
    printf("prime numbers between 2 and the integer  that is entered.\n\n");
    printf("Prime number is a number that is divisible by itself and only one such as\n");
    printf("2, 3, 5, 7, 11, 13\n\n");
    printf("Square numbers are certain pairs of numbers when added together\n");
    printf("give a square number and when subtracted also give a square number.\n");
    printf("This program displays all the pairs of numbers.\n\n");

    int userInput = 0;			// Initialize user input for interaction
    int inputCheck;				// 0 no input, 1 input
    bool runProgram = true; 	// run entire while loop
    bool runFunctions = true;	// run the functions - used after checking number input

    while(runProgram)
    {
        printf("\nEnter A Positive Integer ----> : ");
        inputCheck = scanf("%d", &userInput);

		if(inputCheck == 1) // check if got input
		{
			runFunctions = true;
			if (userInput <0){
				printf("\nInvalid Number, Number must be positive.\n\n");
				runFunctions = false; // don't run the functions if out of bounds
			}
			else if(userInput <= 1 || userInput > 1000) // check if in bounds
			{
				printf("\nInvalid Number, Number must be between 1 and 1000\n\n");
			runFunctions = false; // don't run the functions if out of bounds
			}
			
		}
		else
			runFunctions = false; // don't run functions if no input

		if(runFunctions)
		{
			// check if prime
			bool prime = checkPrime(userInput);
			printf("\n%d is ", userInput);
			if(prime)
				printf(" prime.\n\n");
			else
				printf(" not prime.\n\n");

			// find all primes from 2 to number
			allPrimes(userInput);

			// TO-DO find all square pairings
			squarePairs(userInput);
			}
		
		bool validYesOrNo = false; // to run loop until valid input
		char yesOrNo;
		while(!validYesOrNo)
		{
			printf("\nWould you like to repeat the process for another number?\n\n");
			printf("Enter Y, y or N, n -------->");
			scanf(" %c", &yesOrNo);
			yesOrNo = tolower(yesOrNo);
			if(yesOrNo == 'y')
			{
				validYesOrNo = true;
				runProgram = true;
			}
			else if(yesOrNo == 'n')
			{
				printf("\n\nMathematics and Computer Programming\n");
				printf("Prepared by Brian Bradley and Karyn Remsing\n");
				printf("10-25-2023\n\n");
				validYesOrNo = true;
				runProgram = false;
			}
			else
			{
				printf("\nInvalid choice, must enter Y, y or N, n\n\n");
				validYesOrNo = false;
			}
		}	
    }
    return 0;
}

bool checkPrime(int number)
{
    for(int i = 2; i <= number / 2; i++)
    {
        if(number % i == 0)
	    return false;
    }
    return true;
}

void allPrimes(int number)
{
    // find the last prime for output purposes
    bool lastPrimeFound = false;	// Condition for checking prime
    int lastPrime = number - 1;		// the last prime number
    while(!lastPrimeFound)
    {
	if(checkPrime(lastPrime))
	    lastPrimeFound = true;
	else
	    lastPrime--;
    }

    // find all the primes from 2 to number
    printf("All Prime Numbers between 2 and %d are:\n\n", number);
    for(int i = 2; i < number; i++)
    {
	bool prime = checkPrime(i);
	if(prime)
	{
	    printf("%d", i); // print number if prime
	    if(i != lastPrime)
		printf(", "); // print comma if not the last prime
	}

    }
    printf("\n\n");
}

// Check if number is perfect square
bool perfectSquare(int x)
{
	if (x >= 0) {
        int sr = sqrt(x); 
        // if product of square root is equal, then return T/F
        return (sr * sr == x);
    }
    return false;
}

void squarePairs(int number)
{
	int sum;						// N+P
	int difference;					// P-N
	int arrayLength = (number-2);	// UserInput minus 2
	int numbers[arrayLength];		// array of 2 thorugh the userInput number

    printf("The square pair numbers are:-\n\n");
    printf("\tN\tP\tN+P\tP-N\n");
    printf("-----------------------------------\n\n");

	// Create array of 2 through user input number
	for(int i=2; i<=number; i++){
		numbers[i-2] = i;
	}

	// Iterate through numbersArray, N and P
	for (int n=0; n<= arrayLength; n++){
		for (int p=0; p<=arrayLength; p++){
			sum = (numbers[n] + numbers[p]);
			difference = (numbers[p] - numbers[n]);

			bool sumResult = perfectSquare(sum);
			bool diffResult = perfectSquare(difference);

			if (sumResult == true && diffResult == true && difference !=0){
				printf("%9d%8d%9d%8d \n", numbers[n], numbers[p], sum, difference);
			}
		}
	}

}

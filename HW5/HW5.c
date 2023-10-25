// NAME: Brian Bradley and Karyn Remsing
// CS 4350 - Unix Systems Programming	Section Number: 001
// Serial Number: 3 and 12
// Assignment Number: 5
// Due Date: 10 / 25 / 2023
#include <stdbool.h>
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>

bool checkPrime(int number);
void allPrimes(int number);

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

    int userInput = 0;
    int inputCheck;
    bool validInput = false;

    while(!validInput)
    {
        printf("Enter A Positive Integer ----> : ");

        inputCheck = scanf("%d", &userInput);

	bool prime = checkPrime(userInput);
	printf("%d is ", userInput);
	if(prime)
	    printf(" prime.\n\n");
	else
	    printf(" not prime.\n\n");

	allPrimes(userInput);
        return 0;
    }
}

bool checkPrime(int number)
{
    for(int i = 2; i < number / 2; i++)
    {
        if(number % i == 0)
	    return false;
    }
    return true;
}

void allPrimes(int number)
{
    printf("All Prime Numbers between 2 and %d are:\n\n", number);
    for(int i = 2; i < number; i++)
    {
	bool prime = checkPrime(i);
	if(prime)
	{
	    printf("%d, ", i);
	}

    }
    printf("\n\n");
}

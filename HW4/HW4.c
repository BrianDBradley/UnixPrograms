//NAME : Karyn Remsing and Brian Bradley
//
//Unix Systems Programming - CS4350 - 001
//
//Assignment Number: HW4
//
//Due Date: 10 / 16 / 2023

#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>
#include <stdlib.h>
#include <time.h>

int generateRandomNumber();

int main()
{
    printf("\nPracticing C Programming Language\n\n");
    printf("The purpose of this program is to generate 2 random number\n");
    printf("between 5 and 50 inclusive. A sum will be calculated by adding\n");
    printf("the generated numbers. Then, the program will find the number of\n");
    printf("times it takes for the sum to be reproduced again.\n\n");

    int userInput = 0;
    int inputCheck;
    bool flag = false; 
    int randomNum1, randomNum2;
    srand(time(NULL));

    // Check user input
    while (!flag) {
        printf("Select One of the Following\n\n");
        printf("1 - Generate Numbers\n");
        printf("9 - Exit The Program    ---->    ");

        inputCheck = scanf("%d", &userInput);

        // Check if int, 1 or 9
        if(inputCheck != 1 || (userInput != 1 && userInput != 9)) {
            printf("\n\n**  Invalid Selection **\n\n\n\n");
            flag = false;

            // Clear input buffer to avoid infinite looping
            int c;
            while ((c = getchar()) != '\n' && c != EOF);
        } 

        else {
            flag = true;
        }

    }


    if(userInput == 9)
    {
        printf("\n\n\nProgram is Terminated");
        printf("\n\n Implemented by Brian Bradley and Karyn Remsing");
        printf("10 - 13 - 2023\n");
        return 0;
    }

    if (userInput == 1) {
        int sum;

        randomNum1 = generateRandomNumber();
        printf("\n\nFirst Generated Number: %d\n", randomNum1);

        randomNum2 = generateRandomNumber();
        printf("Second Generated Number: %d\n", randomNum2);

        sum = (randomNum1 + randomNum2);
        printf("\nFirst Number + Second Number  =   %d\n", sum);
    }

}

// Generate numbers between 5 and 50 inclusive
int generateRandomNumber() {
    int randNum = rand() % 46 + 5;
    return randNum;
}
//NAME : Karyn Remsing and Brian Bradley
//
//Unix Systems Programming - CS4350 - 001
//
//Assignment Number: HW4
//
//Due Date: 10 / 16 / 2023

#include <stdio.h>
#include <stdbool.h>

int main()
{

  printf("\nPracticing C Programming Language\n\n");
  printf("The purpose of this program is to generate 2 random number\n");
  printf("between 5 and 50 inclusive. A sum will be calculated by adding\n");
  printf("the generated numbers. Then, the program will find the number of\n");
  printf("times it takes for the sum to be reproduced again.\n\n");

  int userInput = 0;

  bool flag = false; // Initialize the flag to false

  // Check user input
  while (!flag) {
    printf("Select One of the Following\n\n");
    printf("1 - Generate Numbers\n");
    printf("9 - Exit The Program    ---->    ");

    scanf("%d", &userInput);

    if(userInput != 1 && userInput != 9){
      printf("\n\n**  Invalid Selection **\n\n\n\n");
      flag = false;
    }

    // Check the condition and update the flag as needed
    else if (userInput == 1 || userInput == 9) {
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

  if(userInput == 1)
  {
        printf("\n\n Input check working");
  }
}

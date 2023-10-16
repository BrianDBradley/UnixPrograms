#include <stdio.h>

int main()
{

  int userInput = 0;
  // runs infinitely if first input != 1 or 9, idk what to do
  do
  {
  printf("Select One of the Following\n\n");
  printf("1 - Generate Numbers\n");
  printf("9 - Exit The Program    ---->    ");
  scanf("%d", &userInput);
  if(userInput != 1 && userInput != 9)
    printf("\n\n**  Invalid Selection **\n\n\n\n");
  } while(userInput != 1 && userInput !=9);


  if(userInput == 9)
  {
    printf("\n\n\nProgram is Terminated");
    printf("\n\n Implemented by Brian Bradley and Karyn Remsing");
    printf("10 - 13 - 2023\n");
    return 0;
  }

  if(userInput == 1)
  {
    // function calls here
  }
}

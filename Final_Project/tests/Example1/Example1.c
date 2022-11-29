#include <stdio.h>
void myFunc(int input2, int input3);

int main()
{
  int x = 0;
  int y = 1;

  myFunc(x, y);

  return 1;
}

void myFunc(int input2, int input3)
{
  int arr[3] = {1,2,3};
  int input1 = 0;
  int y = 0;

  int x = arr[input1];
  arr[input2] = x;
  y = arr[input3];
  // Two maybe aliased
  return;
}
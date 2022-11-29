#include <stdio.h>
void myFunc();

int main()
{

  myFunc();

  return 1;
}

void myFunc()
{
  int arr[3] = {1,2,3};
  int *b = arr;
  int *z;

  b[0] = 0;
  *z = arr[0] + 5;
  // One not aliased, one maybe aliased
  return;
}
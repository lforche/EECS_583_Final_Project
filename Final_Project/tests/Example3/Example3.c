#include <stdio.h>
void myFunc();

int main()
{
  myFunc();

  return 1;
}

void myFunc()
{
  int x[3] = {1, 2, 3};
  int y[3] = {2, 4, 6};

  x[0] = 3;
  y[0] = 6;
  int z = x[0] + 2;
  // One aliased, one not aliased
  return;
}
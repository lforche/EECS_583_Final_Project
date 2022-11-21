#include <stdio.h>

int main()
{
  int x = 0;
  int y = 1;

  myFunc(x, y);

  return 1;
}

void myFunc(int l2, int l3)
{
  int z[3] = {1,2,3};

  int l1 = 0;
  int r1 = z[l1];
  int r2 = 0;
  
  z[l2] = r1;
  r2 = z[l3];
}
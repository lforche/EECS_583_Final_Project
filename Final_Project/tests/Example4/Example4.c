#include <stdio.h>
void myFunc(int* a, int* b);

int main()
{
  int a[1000];
  int b[1000];

  myFunc(a, b);

  return 1;
}

void myFunc(int* a, int* b)
{
  int c[1000];
  int n = 5;
  for (int j = 0; j < 1000; j++) {
    for (int i = 0; i < 1000; i++) {
      a[i] = i * 2;
      b[i] = i + 10;
      c[i] = a[i] * b[i];
    }
  }
  // Multiple maybe aliased and 2 not aliased
  return;
}
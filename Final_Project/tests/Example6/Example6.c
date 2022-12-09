#include <stdio.h>

void change(int ** x, int * z);
void cant_change(int * x, int * z);

int main()
{
    int c = 1;
    int d = 2;
    int e = 3;
    int * cc = &c;
    int * dd = &d;
    int * ee = &e;
    int ** ccc = &cc;  // pointer to pointer 'a'

    printf("\n cc's value: %x \n", cc);
    printf("\n dd's value: %x \n", dd);
    printf("\n ee's value: %x \n", ee);
    printf("\n can we change cc?, lets see \n");
    printf("\n cc = dd \n");
    cc = dd;
    printf("\n cc's value is now: %x, same as 'dd'... it seems we can, but can we do it in a function? lets see... \n", cc);
    printf("\n cant_change(cc, ee); \n");
    cant_change(cc, ee);
    printf("\n cc's value is now: %x, Doh! same as 'dd'...  that function tricked us. \n", cc);

    printf("\n NOW! lets see if a pointer to a pointer solution can help us... remember that 'ccc' point to 'cc' \n");
     printf("\n change(ccc, ee); \n");
    change(ccc, ee);
    printf("\n cc's value is now: %x, YEAH! same as 'ee'...  that function ROCKS!!!. \n", cc);
    
    return 0;
}

void cant_change(int * x, int * z){
    x = z;
    printf("\n ----> value of 'cc' is: %x inside function, same as 'ee', BUT will it be the same outside of this function? lets see\n", x);
}

void change(int ** x, int * z){
    *x = z;
    printf("\n ----> value of 'cc' is: %x inside function, same as 'ee', BUT will it be the same outside of this function? lets see\n", *x);
}
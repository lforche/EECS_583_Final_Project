/* unixstuff.c - unix specific routines */

#include "xlisp.h"

/* external routines */
extern int rand();


/* osinit - initialize */
osinit(banner)
  char *banner;
{
    printf("%s\n",banner);
}

/* osrand - return a random number between 0 and n-1 */
int osrand(n)
  int n;
{
    return((int)(rand()/4294967296.0 * (double)n));
}

/* osgetc - get a character from the terminal */
int osgetc(fp)
  FILE *fp;
{
    return(getc(fp));
}

/* osputc - put a character to the terminal */
osputc(ch,fp)
  int ch; FILE *fp;
{
    putc(ch, fp);
}

/* oscheck - check for control characters during execution */
oscheck()
{
    /* NIX */
}

/* osfinit - initialize pc specific functions */
osfinit()
{
    /* NIX */
}

/* osfinish - cleanup before exit */
osfinish()
{
    /* NIX */
}


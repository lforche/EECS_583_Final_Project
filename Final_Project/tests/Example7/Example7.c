#include <stdio.h>
#include <stdlib.h>

// __asm__ volatile ("xchg %r13, %r13");  
const int LOOPCOUNT = 100000000;
const int INFTY = 10;

int P6Viterbi (int **x, int **y, int **z, int **q, int loopAmount, int loopCount);

int main()
{
    int c = 1;
    int d = 2;
    int e = 3;

    int *cc = (int *)malloc(LOOPCOUNT * sizeof(int));
    int *dd = (int *)malloc(LOOPCOUNT * sizeof(int));
    int *ee = (int *)malloc(LOOPCOUNT * sizeof(int));

    int **ccc = (int **)malloc(LOOPCOUNT * sizeof(int *));
    int **ddd = (int **)malloc(LOOPCOUNT * sizeof(int *));
    int **eee = (int **)malloc(LOOPCOUNT * sizeof(int *));
    int **fff = (int **)malloc(LOOPCOUNT * sizeof(int *));

    for (int i = 0; i < LOOPCOUNT; i++)
    {
        cc[i] = c;
        dd[i] = d;
        ee[i] = e;
        
        ccc[i] = cc;
        ddd[i] = dd;
        eee[i] = ee;
        fff[i] = dd;
    }

    printf("%d\n", P6Viterbi(ccc, ddd, eee, fff, 10, LOOPCOUNT));
    
    return 0;
}

int P6Viterbi (int **x, int **y, int **z, int **q, int loopAmount, int loopCount)
{
    int *a, *b, *c, *e, *p, *t;

    int sc = 0;

    for (int i = 3; i < loopAmount; i++)
    {   
        a = x[i];
        b = y[i];
        c = z[i];

        e = x[i-1];

        p = y[i-3];

        t = q[i-3];

        for (int k = 1; k <= loopCount; k++) {
            a[k] = b[k-1] + c[k-1];
            e[k] = b[k-1] + c[k-1];
            p[k] += t[k];
        }
    }

    return sc;
}
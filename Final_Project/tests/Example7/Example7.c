#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// __asm__ volatile ("xchg %r13, %r13");  
// const int LOOPCOUNT = 100000000;
const int LOOPCOUNT = 100000000;
const int INFTY = 10;

int P6Viterbi (int **x, int **y, int **z, int **q, int loopAmount, int loopCount);

int main()
{

    int c = 1;
    int d = 2;
    int e = 3;
    int f = 4;

    int *cc = (int *)malloc(LOOPCOUNT * sizeof(int));
    int *dd = (int *)malloc(LOOPCOUNT * sizeof(int));
    int *ee = (int *)malloc(LOOPCOUNT * sizeof(int));
    int *ff = (int *)malloc(LOOPCOUNT * sizeof(int));

    int **ccc = (int **)malloc(LOOPCOUNT * sizeof(int *));
    int **ddd = (int **)malloc(LOOPCOUNT * sizeof(int *));
    int **eee = (int **)malloc(LOOPCOUNT * sizeof(int *));
    int **fff = (int **)malloc(LOOPCOUNT * sizeof(int *));

    for (int i = 0; i < LOOPCOUNT; i++)
    {
        cc[i] = c;
        dd[i] = d;
        ee[i] = e;
        ff[i] = f;
        
        ccc[i] = cc;
        ddd[i] = dd;
        eee[i] = ee;
        fff[i] = ff;
    }

    clock_t start_t, end_t;
    double total_t;

    start_t = clock();
    c = P6Viterbi(ccc, ddd, eee, fff, 10, LOOPCOUNT);    
    end_t = clock();
    total_t = (double)(end_t - start_t) / CLOCKS_PER_SEC;

    printf("%d\n", P6Viterbi(ccc, ddd, eee, fff, 1, LOOPCOUNT));
    printf("TOTAL CPU TIME: %f\n", total_t);
    
    return 0;
}

int P6Viterbi (int **x, int **y, int **z, int **q, int loopAmount, int loopCount)
{
    int *a, *b, *c, *e, *p, *t;
    int bint, cint;

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
        // __asm__ volatile ("xchg %r13, %r13"); 
            a[k] = b[k-1] + c[k-1];
            t[k]++;
            e[k] = b[k-1] + c[k-1];
            b[k] = t[k];
            c[k] = e[k];
            t[k]++;
        // __asm__ volatile ("xchg %r13, %r13"); 
            p[k] += t[k];
        //     bint = t[k];
        //     a[k] = b[k-1] + c[k-1];
        //     bint++;
        //     e[k] = b[k-1] + c[k-1];
        // __asm__ volatile ("xchg %r13, %r13"); 
        //     p[k] += bint;
        // __asm__ volatile ("xchg %r13, %r13");  
        }
    }

    return sc;
}
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
    // int bunalias = 0;
    // int cunalias = 0;
    // int allaliased = 0;
    int tunalias = 0;

    // int bint;
    // int cint;
    int tint;
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



        if ((tunalias != 1) && ((&b[loopCount] < &t[1]) || (&b[1] > &t[loopCount]) &&
        (&c[loopCount] < &t[1]) || (&c[1] > &t[loopCount]) &&
        (&e[loopCount] < &t[1]) || (&e[1] > &t[loopCount])))
        {
            tunalias = 1; 
            // printf("t is unaliased\n");
        }
        // else
        // {
        //     printf("b[0]: %p\n", &b[0]);
        //     printf("c[0]: %p\n", &c[0]);
        //     printf("e[0]: %p\n", &e[0]);
        //     printf("t[0]: %p\n", &t[0]);
        // }
        // else if (((&a[loopCount] < &b[1]) || (&a[1] > &b[loopCount])) && 
        //     ((&t[loopCount] < &b[1]) || (&t[1] > &b[loopCount])) &&
        //     ((&c[loopCount] < &b[1]) || (&c[1] > &b[loopCount])) && 
        //     ((&e[loopCount] < &b[1]) || (&e[1] > &b[loopCount])))
        // {
        //         bunalias = 1;
        // } 
        // else if ((&a[loopCount] < &c[1]) || (&a[1] > &c[loopCount]))
        // {
        //         cunalias = 1;
        // }
        // else
        // {
                // allaliased = 1;
        // }
// __asm__ volatile ("xchg %r13, %r13");

        for (int k = 1; k <= loopCount; k++) {
 
            a[k] = b[k-1] + c[k-1];
            if (tunalias == 1)
            {
                tint = t[k];
                sc += tint;
                e[k] = b[k-1] + c[k-1];
                t[k] = tint;
                p[k] += tint;

            }
            else
            {
                sc += t[k];
                e[k] = b[k-1] + c[k-1];
                p[k] += t[k];
            }

            sc += p[k];
// __asm__ volatile ("xchg %r13, %r13");  
            //Line 1
            // if (bunalias == 1)
            // {
            //     bint = b[k-1];
            //     a[k] = bint + c[k-1];
            // }
            // else if (cunalias)
            // {
            //     cint = c[k-1];
            //     a[k] = b[k-1] + cint;
            // }
            // else
            // {
            //     a[k] = b[k-1] + c[k-1];
            // }
            //
            // if (tunalias == 1)
            // {
            //     tint = t[k];
            //     tint++;
            // }
            // else
            // {
            //     t[k]++;
            // }
            //
            // //Line 2
            //
            // if (bunalias == 1)
            // {
            //     e[k] = bint + c[k-1];
            //     //store bint to b[k]
            // }
            // else if (cunalias)
            // {
            //     e[k] = b[k-1] + cint;
            // }
            // else
            // {
            //     e[k] = b[k-1] + c[k-1];
            // }
            //
            // if (tunalias == 1)
            // {
            //     p[k] += tint;
            // }
            // else
            // {
            //     p[k] += t[k];
            // }
        }
    }

    return sc;
}
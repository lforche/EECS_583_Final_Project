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

    for (int i = 0; i < LOOPCOUNT; i++)
    {
        cc[i] = c;
        dd[i] = d;
        ee[i] = e;
    }

    int **ccc = (int **)malloc(LOOPCOUNT * sizeof(int *));
    int **ddd = (int **)malloc(LOOPCOUNT * sizeof(int *));
    int **eee = (int **)malloc(LOOPCOUNT * sizeof(int *));
    int **fff = (int **)malloc(LOOPCOUNT * sizeof(int *));

    for (int i = 0; i < LOOPCOUNT; i++)
    {
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
    int *a, *b, *c, *d;
    int *e, *f, *g, *h;
    int *u, *l, *m, *n;
    int *o, *p, *r, *s;
    int *t;

    int sc = 0;

    for (int i = 3; i < loopAmount; i++)
    {   
        a = x[i];
        b = y[i];
        c = z[i];
        d = q[i];

        e = x[i-1];
        f = y[i-1];
        g = z[i-1];
        h = q[i-1];
        
        u = x[i-2];
        l = y[i-2];
        m = z[i-2];
        n = q[i-2];

        o = x[i-3];
        p = y[i-3];
        r = z[i-3];
        s = q[i-3];

        t = q[i-3];

        // for (int j = 0; j < loopCount; j++)
        // {
        //     a[j] = b[j] + c[j];
        //     d[j] = a[j] + c[j];
        //     sc += d[j];
        // }
        for (int k = 1; k <= loopCount; k++) {
            a[k] = b[k-1]   + c[k-1];

            if ((sc = d[k-1]  + e[k-1]) > a[k])  
                a[k] = sc;
            if ((sc = f[k-1] + g[k-1]) > a[k])  
                a[k] = sc;
            if ((sc = h[k]  + u[k])         > a[k])  
                a[k] = sc; 

            a[k] += l[k];

            if (a[k] < -INFTY) a[k] = -INFTY;  

            m[k] = m[k-1] + n[k-1];
            if ((sc = a[k-1] + o[k-1]) > m[k]) m[k] = sc;
            if (m[k] < -INFTY) m[k] = -INFTY;
            if (k < 10) {
                p[k] = b[k] + r[k];
                if ((sc = d[k] + s[k]) > p[k]) p[k] = sc; 
                p[k] += t[k];
                if (p[k] < -INFTY) p[k] = -INFTY; 
            }
        }
    }

    return sc;
}
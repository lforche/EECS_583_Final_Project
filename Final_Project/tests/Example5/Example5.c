#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>


#include "Example5.h"

#define currentM 10
#define currentMaxCode 24
#define big 300

int testFunc(int L, int M, int *esc, int **msc, int **isc, int **xsc, int **mmx, int **dmx, int **imx, int **xmx);

int main()
{

    int L = 284;
    int M = currentM;
    int escArr[currentM] = {0};
    int mscArr[currentMaxCode][currentM] = {0};
    int iscArr[currentMaxCode][currentM-1] = {0};
    int xscArr[currentMaxCode-1][currentM-1] = {0};
    int mmxArr[big][big] = {0};
    int dmxArr[big][big] = {0};
    int imxArr[big][big] = {0};
    int xmxArr[big][big] = {0};

    int *ptr, **ptrptr;
    int myint = 0;
    ptr = myint;
    ptrptr = ptr;

    int *esc = escArr;
    int **msc = &mscArr;
    int **isc = *iscArr;
    int **xsc = *xscArr;
    int **mmx = *mmxArr;
    int **dmx = *dmxArr;
    int **imx = *imxArr;
    int **xmx = *xmxArr;

    return testFunc(L, M, esc, msc, isc, xsc, mmx, dmx, imx, xmx);
    // int sc = 0;
    //int mc[ARRAY_SIZE] = {0};
    // int mpp[ARRAY_SIZE] = {0};
    // int tpmm[ARRAY_SIZE] = {0};
    // int ip[ARRAY_SIZE] = {0};
    // int tpim[ARRAY_SIZE] = {0};
    // int dpp[ARRAY_SIZE] = {0};
    // int tpdm[ARRAY_SIZE] = {0};
    // int xmb[ARRAY_SIZE] = {0};
    // int bp[ARRAY_SIZE] = {0};
    // int ms[ARRAY_SIZE] = {0};
    // int dc[ARRAY_SIZE] = {0};
    // int tpdd[ARRAY_SIZE] = {0};
    // int tpmd[ARRAY_SIZE] = {0};
    // int tpmi[ARRAY_SIZE] = {0};
    // int tpii[ARRAY_SIZE] = {0};
    // int ic[ARRAY_SIZE] = {0};
    // int is[ARRAY_SIZE] = {0};
    //
    // int *mc, *mpp, *tpmm, *ip, *tpim,
    // *dpp, *tpdm, *xmb, *bp, *ms, *dc, *tpdd,
    // *tpmd, *tpmi, *tpii, *ic, *is;
    //
    // for (int j = 0; j < ARRAY_SIZE; j++)
    // {
    //     mc[j] = j;
    //     mpp[j] = j;
    //     tpmm[j] = j;
    //     ip[j] = j;
    //     tpim[j] = j;
    //     dpp[j] = j;
    //     tpdm[j] = j;
    //     xmb[j] = j;
    //     bp[j] = j;
    //     ms[j] = j;
    //     dc[j] = j;
    //     tpdd[j] = j;
    //     tpmd[j] = j;
    //     tpmi[j] = j;
    //     tpii[j] = j;
    //     ic[j] = j;
    //     is[j] = j;
    // }
    //
    // for (int k = 1; k <= M; k++) {
    //     mc[k] = mpp[k-1]   + tpmm[k-1];
    //     if ((sc = ip[k-1]  + tpim[k-1]) > mc[k])  mc[k] = sc;
    //     if ((sc = dpp[k-1] + tpdm[k-1]) > mc[k])  mc[k] = sc;
    //     if ((sc = xmb  + bp[k])         > mc[k])  mc[k] = sc; 
    //     mc[k] += ms[k];
    //     if (mc[k] < -INFTY) mc[k] = -INFTY;  
    //
    //     dc[k] = dc[k-1] + tpdd[k-1];
    //     if ((sc = mc[k-1] + tpmd[k-1]) > dc[k]) dc[k] = sc;
    //     if (dc[k] < -INFTY) dc[k] = -INFTY;
    //
    //     if (k < M) {
    //         ic[k] = mpp[k] + tpmi[k];
    //         if ((sc = ip[k] + tpii[k]) > ic[k]) ic[k] = sc; 
    //         ic[k] += is[k];
    //         if (ic[k] < -INFTY) ic[k] = -INFTY; 
    //     }
    // }


    
    // int x = P7Viterbi('h', 3, temp, temp2, temp3);

    /*char *x = "\030\020\b\t\017\t\000\t\020\021\r\021\b\b\017\t\000\t\t\v\r\003\006\020\t\000\004\r\t\006\021\005\021\t\r\004\a\002\n\005\016\t\021\020\021\002\020\f\t\006\f\005\000\a\017\000\b\r\017\003\t\r\f\t\004\017\021\022\003\020\023\005\003\005\002\a\016\017\005\000\004\r\a\a\000\a\b\020\003\r\n\000\017\020\000\002\023\017\017\016\003\017\016\t\t\016\a\022\005\n\021\a\021\004\021\020\n\t\017\000\003\023\003\021\002\017\021\021\023\021\b\b\t\022\017\t\017\r\020\020\t\v\021\017\020\000\005\004\017\b\t\003\017\017\020\000\000\a\r\017\t\020\n\002\003\t\f\003\005\000\t\a\017\017\023\016\004\023\020\020\t\023\005\005\f\021\020\a\023\f\020\t\006\003\t\000\022\000\021\005\005\005";
    int L = 283;    
    struct plan7_s myhmm = {
        .M = 10,
        .xsc = {{-8455,0},{-1000,-1000},{0,0},{-8455,0}},
        .tsc = {{-31, -29, -29, -29, -29, -29, -29, -29, -29},  {-5926, -6041, -6041, -6041, -6041, -6041, -6041, -6041, -6041}, 
                {-6974, -7087, -7087, -7087, -7087, -7087, -7087, -7087, -7087}, {-890, -890, -890, -890, -890, -890, -890, -890, -890},
                {-1111, -1111, -1111, -1111, -1111, -1111, -1111, -1111, -1111}, {-697, -697, -697, -697, -697, -697, -697, -697, -697},
                {-1378, -1378, -1378, -1378, -1378, -1378, -1378, -1378, -1378}},
        .bsc = 0,
        .msc = {0},
        .begin = {0},
        .isc = {0},
        .esc = {0},
        .p1 = 


    };
    struct plan7_s *hmm = &myhmm;
    struct dpmatrix_s *mx;
    struct p7trace_s ** ret_tr;

    // hmm->xsc[0] = {{-8455,0},{-1000,-1000},{0,0},{-8455,0}};

    // hmm->tsc[0] = {0};

    mx->maxM = 10;
    mx->maxN = 1;*/

    // clock_t start, end;
    // double cpu_time_used;
    
    // start = clock();
    // P7Viterbi(x, L, hmm, mx, ret_tr);
    // end = clock();
    // cpu_time_used = ((double) (end - start));
    // printf("%f", cpu_time_used);
    // return 0;
}

int testFunc(int L, int M, int *esc, int **msc, int **isc, int **xsc, int **mmx, int **dmx, int **imx, int **xmx)
{  
    int *mc, *dc, *ic, *mpp, *dpp, *ip, *xmb, *ms, *is;
    int *tpmm, *tpim, *tpdm, *tpdd, *tpmd, *tpmi, *tpii, *bp, *mpc, *ep;
    int sc = 0;

    for (int i = 1; i <= L; i++) {
    mc    = mmx[i];    
    dc    = dmx[i];
    ic    = imx[i];
    mpp   = mmx[i-1];
    dpp   = dmx[i-1];
    ip    = imx[i-1];
    xmb   = xmx[i-1][XMB];
    ms    = msc[i];
    is    = isc[i];
    mc[0] = -INFTY;
    dc[0] = -INFTY;
    ic[0] = -INFTY;


    for (int k = 1; k <= M; k++) {
        mc[k] = mpp[k-1]   + tpmm[k-1];

        __asm__ volatile ("xchg %r13, %r13");  
        if ((sc = ip[k-1]  + tpim[k-1]) > mc[k])  
            mc[k] = sc;
        __asm__ volatile ("xchg %r13, %r13");  
        if ((sc = dpp[k-1] + tpdm[k-1]) > mc[k])  
            mc[k] = sc;
        __asm__ volatile ("xchg %r13, %r13");  
        if ((sc = xmb  + bp[k])         > mc[k])  
            mc[k] = sc; 
        __asm__ volatile ("xchg %r13, %r13");  
     
        mc[k] += ms[k];

        if (mc[k] < -INFTY) mc[k] = -INFTY;  

        dc[k] = dc[k-1] + tpdd[k-1];
        if ((sc = mc[k-1] + tpmd[k-1]) > dc[k]) dc[k] = sc;
        if (dc[k] < -INFTY) dc[k] = -INFTY;
        __asm__ volatile ("xchg %r13, %r13");  
        if (k < M) {
            ic[k] = mpp[k] + tpmi[k];
            if ((sc = ip[k] + tpii[k]) > ic[k]) ic[k] = sc; 
            ic[k] += is[k];
            if (ic[k] < -INFTY) ic[k] = -INFTY; 
        }
    }

    /* Now the special states. Order is important here.
     * remember, C and J emissions are zero score by definition,
     */
                /* N state */
    xmx[i][XMN] = -INFTY;
    if ((sc = xmx[i-1][XMN] + xsc[XTN][LOOP]) > -INFTY)
      xmx[i][XMN] = sc;

                /* E state */
    int xme = -INFTY;
    mpc = mmx[i];
    ep  = esc;
    for (int k = 1; k <= M; k++)
      if ((sc =  mpc[k] + ep[k]) > xme) xme = sc; 
    xmx[i][XME] = xme;
                /* J state */
    xmx[i][XMJ] = -INFTY;
    if ((sc = xmx[i-1][XMJ] + xsc[XTJ][LOOP]) > -INFTY)
      xmx[i][XMJ] = sc;
    if ((sc = xmx[i][XME]   + xsc[XTE][LOOP]) > xmx[i][XMJ])
      xmx[i][XMJ] = sc;

                /* B state */
    xmx[i][XMB] = -INFTY;
    if ((sc = xmx[i][XMN] + xsc[XTN][MOVE]) > -INFTY)
      xmx[i][XMB] = sc;
    if ((sc = xmx[i][XMJ] + xsc[XTJ][MOVE]) > xmx[i][XMB])
      xmx[i][XMB] = sc;

                /* C state */
    xmx[i][XMC] = -INFTY;
    if ((sc = xmx[i-1][XMC] + xsc[XTC][LOOP]) > -INFTY)
      xmx[i][XMC] = sc;
    if ((sc = xmx[i][XME] + xsc[XTE][MOVE]) > xmx[i][XMC])
      xmx[i][XMC] = sc;
  }
    return sc;
}

int P7Viterbi(char *dsq, int L, struct plan7_s *hmm, struct dpmatrix_s *mx, struct p7trace_s **ret_tr)
{
  struct p7trace_s  *tr;
  int **xmx;
  int **mmx;
  int **imx;
  int **dmx;
  int   i,k;
  int   sc;
  int  *mc, *dc, *ic;        /* pointers to rows of mmx, dmx, imx */
  int  *ms, *is;             /* pointers to msc[i], isc[i] */
  int  *mpp, *mpc, *ip;      /* ptrs to mmx[i-1], mmx[i], imx[i-1] */
  int  *bp;          /* ptr into bsc[] */
  int  *ep;                  /* ptr into esc[] */
  int   xmb;             /* value of xmx[i-1][XMB] */
  int   xme;                 /* max for xmx[i][XME] */
  int  *dpp;                 /* ptr into dmx[i-1] (previous row) */
  int  *tpmm, *tpmi, *tpmd, *tpim, *tpii, *tpdm, *tpdd; /* ptrs into tsc */
  int   M;
  
//   /* Make sure we have space for a DP matrix with 0..L rows, 0..M-1 columns.
//    */ 
  ResizePlan7Matrix(mx, L, hmm->M, &xmx, &mmx, &imx, &dmx);

  /* Initialization of the zero row.
   */
  xmx[0][XMN] = 0;                           /* S->N, p=1            */
  xmx[0][XMB] = hmm->xsc[XTN][MOVE];                 /* S->N->B, no N-tail   */
  xmx[0][XME] = xmx[0][XMC] = xmx[0][XMJ] = -INFTY;  /* need seq to get here */
  for (k = 0; k <= hmm->M; k++)
    mmx[0][k] = imx[0][k] = dmx[0][k] = -INFTY;      /* need seq to get here */

  /* Initializations that help icc vectorize.
   */
  M = hmm->M;

  /* Recursion. Done as a pull.
   * Note some slightly wasteful boundary conditions:  
   *    tsc[0] = -INFTY for all eight transitions (no node 0)
   *    D_M and I_M are wastefully calculated (they don't exist)
   */

  tpmm  = hmm->tsc[TMM];
  tpim  = hmm->tsc[TIM];
  tpdm  = hmm->tsc[TDM];
  tpmd  = hmm->tsc[TMD];
  tpdd  = hmm->tsc[TDD];
  tpmi  = hmm->tsc[TMI];
  tpii  = hmm->tsc[TII];
  bp    = hmm->bsc;
  for (i = 1; i <= L; i++) {
    mc    = mmx[i];    
    dc    = dmx[i];
    ic    = imx[i];
    mpp   = mmx[i-1];
    dpp   = dmx[i-1];
    ip    = imx[i-1];
    xmb   = xmx[i-1][XMB];
    ms    = hmm->msc[(int) dsq[i]];
    is    = hmm->isc[(int) dsq[i]];
    mc[0] = -INFTY;
    dc[0] = -INFTY;
    ic[0] = -INFTY;
    // __asm__ volatile ("nop");
    for (k = 1; k <= M; k++) {
        mc[k] = mpp[k-1]   + tpmm[k-1];

        if ((sc = ip[k-1]  + tpim[k-1]) > mc[k])  
            mc[k] = sc;
        if ((sc = dpp[k-1] + tpdm[k-1]) > mc[k])  
            mc[k] = sc;
        if ((sc = xmb  + bp[k])         > mc[k])  
            mc[k] = sc; 
            
        __asm__ volatile ("nop");
     
        mc[k] += ms[k];

        if (mc[k] < -INFTY) mc[k] = -INFTY;  

        dc[k] = dc[k-1] + tpdd[k-1];
        if ((sc = mc[k-1] + tpmd[k-1]) > dc[k]) dc[k] = sc;
        if (dc[k] < -INFTY) dc[k] = -INFTY;

        if (k < M) {
            ic[k] = mpp[k] + tpmi[k];
            if ((sc = ip[k] + tpii[k]) > ic[k]) ic[k] = sc; 
            ic[k] += is[k];
            if (ic[k] < -INFTY) ic[k] = -INFTY; 
        }
    }
    // __asm__ volatile ("nop");

    /* Now the special states. Order is important here.
     * remember, C and J emissions are zero score by definition,
     */
                /* N state */
    xmx[i][XMN] = -INFTY;
    if ((sc = xmx[i-1][XMN] + hmm->xsc[XTN][LOOP]) > -INFTY)
      xmx[i][XMN] = sc;

                /* E state */
    xme = -INFTY;
    mpc = mmx[i];
    ep  = hmm->esc;
    for (k = 1; k <= hmm->M; k++)
      if ((sc =  mpc[k] + ep[k]) > xme) xme = sc; 
    xmx[i][XME] = xme;
                /* J state */
    xmx[i][XMJ] = -INFTY;
    if ((sc = xmx[i-1][XMJ] + hmm->xsc[XTJ][LOOP]) > -INFTY)
      xmx[i][XMJ] = sc;
    if ((sc = xmx[i][XME]   + hmm->xsc[XTE][LOOP]) > xmx[i][XMJ])
      xmx[i][XMJ] = sc;

                /* B state */
    xmx[i][XMB] = -INFTY;
    if ((sc = xmx[i][XMN] + hmm->xsc[XTN][MOVE]) > -INFTY)
      xmx[i][XMB] = sc;
    if ((sc = xmx[i][XMJ] + hmm->xsc[XTJ][MOVE]) > xmx[i][XMB])
      xmx[i][XMB] = sc;

                /* C state */
    xmx[i][XMC] = -INFTY;
    if ((sc = xmx[i-1][XMC] + hmm->xsc[XTC][LOOP]) > -INFTY)
      xmx[i][XMC] = sc;
    if ((sc = xmx[i][XME] + hmm->xsc[XTE][MOVE]) > xmx[i][XMC])
      xmx[i][XMC] = sc;
  }
               /* T state (not stored) */
  sc = xmx[L][XMC] + hmm->xsc[XTC][MOVE];

  if (ret_tr != NULL) {
    // P7ViterbiTrace(hmm, dsq, L, mx, &tr);
    *ret_tr = tr;
  }

//   return Scorify(sc);       /* the total Viterbi score. */
return 0;
}

void ResizePlan7Matrix(struct dpmatrix_s *mx, int N, int M, 
          int ***xmx, int ***mmx, int ***imx, int ***dmx)
{
  int i,n;

  if (N <= mx->maxN && M <= mx->maxM) 
    {
      if (xmx != NULL) *xmx = mx->xmx;
      if (mmx != NULL) *mmx = mx->mmx;
      if (imx != NULL) *imx = mx->imx;
      if (dmx != NULL) *dmx = mx->dmx;
      Die("oof");
    }

//   if (N > mx->maxN) {
//     N          += mx->padN; 
//     mx->maxN    = N; 
//     mx->xmx     = (int **) ReallocOrDie (mx->xmx, sizeof(int *) * (N+1));
//     mx->mmx     = (int **) ReallocOrDie (mx->mmx, sizeof(int *) * (N+1));
//     mx->imx     = (int **) ReallocOrDie (mx->imx, sizeof(int *) * (N+1));
//     mx->dmx     = (int **) ReallocOrDie (mx->dmx, sizeof(int *) * (N+1));
//   }

//   if (M > mx->maxM) {
//     M += mx->padM; 
//     mx->maxM = M; 
//   }

//   mx->xmx_mem = ReallocOrDie (mx->xmx_mem, sizeof(int) * (N+1)*(5 + 16));
//   mx->mmx_mem = ReallocOrDie (mx->mmx_mem, sizeof(int) * (N+1)*(M+2+16));
//   mx->imx_mem = ReallocOrDie (mx->imx_mem, sizeof(int) * (N+1)*(M+2+16));
//   mx->dmx_mem = ReallocOrDie (mx->dmx_mem, sizeof(int) * (N+1)*(M+2+16));
  
//   mx->xmx[0] = (int *) (((((unsigned long int) mx->xmx_mem) + 15) & (~0xf)) + 12);
//   mx->mmx[0] = (int *) (((((unsigned long int) mx->mmx_mem) + 15) & (~0xf)) + 12);
//   mx->imx[0] = (int *) (((((unsigned long int) mx->imx_mem) + 15) & (~0xf)) + 12);
//   mx->dmx[0] = (int *) (((((unsigned long int) mx->dmx_mem) + 15) & (~0xf)) + 12);
  
//   /* And make sure the beginning of each row is aligned the same way */
//   for (i = 1; i <= N; i++)
//     {
//       mx->xmx[i] = mx->xmx[0] + i*(5+11) ; /* add 11 bytes per row, making it divisible by 4 */
//       n = 12 - (M+2)%4;
//       mx->mmx[i] = mx->mmx[0] + i*(M+2+n);
//       mx->imx[i] = mx->imx[0] + i*(M+2+n);
//       mx->dmx[i] = mx->dmx[0] + i*(M+2+n);
//     }
 
//   if (xmx != NULL) *xmx = mx->xmx;
//   if (mmx != NULL) *mmx = mx->mmx;
//   if (imx != NULL) *imx = mx->imx;
//   if (dmx != NULL) *dmx = mx->dmx;
}

void *sre_realloc(char *file, int line, void *p, size_t size)
{
  void *ptr;

  if ((ptr = realloc(p, size)) == NULL)
    {
        printf("DIEDDDDDDDDDDDDDDDDDDDDDDDDDDD");
        exit(1);
    }
  return ptr;
}

void P7ViterbiTrace(struct plan7_s *hmm, char *dsq, int N, struct dpmatrix_s *mx, struct p7trace_s **ret_tr)
{
    return;
//   struct p7trace_s *tr;
//   int curralloc;		/* current allocated length of trace */
//   int tpos;			/* position in trace */
//   int i;			/* position in seq (1..N) */
//   int k;			/* position in model (1..M) */
//   int **xmx, **mmx, **imx, **dmx;
//   int sc;			/* temp var for pre-emission score */

//   /* Overallocate for the trace.
//    * S-N-B- ... - E-C-T  : 6 states + N is minimum trace;
//    * add N more as buffer.             
//    */
//   curralloc = N * 2 + 6; 
//   P7AllocTrace(curralloc, &tr);

//   xmx = mx->xmx;
//   mmx = mx->mmx;
//   imx = mx->imx;
//   dmx = mx->dmx;

//   /* Initialization of trace
//    * We do it back to front; ReverseTrace() is called later.
//    */
//   tr->statetype[0] = STT;
//   tr->nodeidx[0]   = 0;
//   tr->pos[0]       = 0;
//   tr->statetype[1] = STC;
//   tr->nodeidx[1]   = 0;
//   tr->pos[1]       = 0;
//   tpos = 2;
//   i    = N;			/* current i (seq pos) we're trying to assign */

//   /* Traceback
//    */
//   while (tr->statetype[tpos-1] != STS) {
//     switch (tr->statetype[tpos-1]) {
//     case STM:			/* M connects from i-1,k-1, or B */
//       sc = mmx[i+1][k+1] - hmm->msc[(int) dsq[i+1]][k+1];
//       if (sc <= -INFTY) { P7FreeTrace(tr); *ret_tr = NULL; return; }
//       else if (sc == xmx[i][XMB] + hmm->bsc[k+1])
// 	{
// 				/* Check for wing unfolding */
// 	  if (Prob2Score(hmm->begin[k+1], hmm->p1) + 1 * INTSCALE <= hmm->bsc[k+1])
// 	    while (k > 0)
// 	      {
// 		tr->statetype[tpos] = STD;
// 		tr->nodeidx[tpos]   = k--;
// 		tr->pos[tpos]       = 0;
// 		tpos++;
// 		if (tpos == curralloc) 
// 		  {				/* grow trace if necessary  */
// 		    curralloc += N;
// 		    P7ReallocTrace(tr, curralloc);
// 		  }
// 	      }

// 	  tr->statetype[tpos] = STB;
// 	  tr->nodeidx[tpos]   = 0;
// 	  tr->pos[tpos]       = 0;
// 	}
//       else if (sc == mmx[i][k] + hmm->tsc[TMM][k])
// 	{
// 	  tr->statetype[tpos] = STM;
// 	  tr->nodeidx[tpos]   = k--;
// 	  tr->pos[tpos]       = i--;
// 	}
//       else if (sc == imx[i][k] + hmm->tsc[TIM][k])
// 	{
// 	  tr->statetype[tpos] = STI;
// 	  tr->nodeidx[tpos]   = k;
// 	  tr->pos[tpos]       = i--;
// 	}
//       else if (sc == dmx[i][k] + hmm->tsc[TDM][k])
// 	{
// 	  tr->statetype[tpos] = STD;
// 	  tr->nodeidx[tpos]   = k--;
// 	  tr->pos[tpos]       = 0;
// 	}
//       else
// 	Die("traceback failed");
//       break;

//     case STD:			/* D connects from M,D */
//       if (dmx[i][k+1] <= -INFTY) { P7FreeTrace(tr); *ret_tr = NULL; return; }
//       else if (dmx[i][k+1] == mmx[i][k] + hmm->tsc[TMD][k])
// 	{
// 	  tr->statetype[tpos] = STM;
// 	  tr->nodeidx[tpos]   = k--;
// 	  tr->pos[tpos]       = i--;
// 	}
//       else if (dmx[i][k+1] == dmx[i][k] + hmm->tsc[TDD][k]) 
// 	{
// 	  tr->statetype[tpos] = STD;
// 	  tr->nodeidx[tpos]   = k--;
// 	  tr->pos[tpos]       = 0;
// 	}
//       else Die("traceback failed");
//       break;

//     case STI:			/* I connects from M,I */
//       sc = imx[i+1][k] - hmm->isc[(int) dsq[i+1]][k];
//       if (sc <= -INFTY) { P7FreeTrace(tr); *ret_tr = NULL; return; }
//       else if (sc == mmx[i][k] + hmm->tsc[TMI][k])
// 	{
// 	  tr->statetype[tpos] = STM;
// 	  tr->nodeidx[tpos]   = k--;
// 	  tr->pos[tpos]       = i--;
// 	}
//       else if (sc == imx[i][k] + hmm->tsc[TII][k])
// 	{
// 	  tr->statetype[tpos] = STI;
// 	  tr->nodeidx[tpos]   = k;
// 	  tr->pos[tpos]       = i--;
// 	}
//       else Die("traceback failed");
//       break;

//     case STN:			/* N connects from S, N */
//       if (i == 0 && xmx[i][XMN] == 0)
// 	{
// 	  tr->statetype[tpos] = STS;
// 	  tr->nodeidx[tpos]   = 0;
// 	  tr->pos[tpos]       = 0;
// 	}
//       else if (i > 0 && xmx[i+1][XMN] == xmx[i][XMN] + hmm->xsc[XTN][LOOP])
// 	{
// 	  tr->statetype[tpos] = STN;
// 	  tr->nodeidx[tpos]   = 0;
// 	  tr->pos[tpos]       = 0;    /* note convention adherence:  */
// 	  tr->pos[tpos-1]     = i--;  /* first N doesn't emit        */
// 	}
//       else Die("traceback failed");
//       break;

//     case STB:			/* B connects from N, J */
//       if (xmx[i][XMB] <= -INFTY) { P7FreeTrace(tr); *ret_tr = NULL; return; }
//       else if (xmx[i][XMB] == xmx[i][XMN] + hmm->xsc[XTN][MOVE])
// 	{
// 	  tr->statetype[tpos] = STN;
// 	  tr->nodeidx[tpos]   = 0;
// 	  tr->pos[tpos]       = 0;
// 	}
//       else if (xmx[i][XMB] == xmx[i][XMJ] + hmm->xsc[XTJ][MOVE])
// 	{
// 	  tr->statetype[tpos] = STJ;
// 	  tr->nodeidx[tpos]   = 0;
// 	  tr->pos[tpos]       = 0;
// 	}

//       else Die("traceback failed");
//       break;

//     case STE:			/* E connects from any M state. k set here */
//       if (xmx[i][XME] <= -INFTY) { P7FreeTrace(tr); *ret_tr = NULL; return; }
//       for (k = hmm->M; k >= 1; k--)
// 	if (xmx[i][XME] == mmx[i][k] + hmm->esc[k])
// 	  {
// 				/* check for wing unfolding */
// 	    if (Prob2Score(hmm->end[k], 1.) + 1*INTSCALE <=  hmm->esc[k])
// 	      {
// 		int dk;		/* need a tmp k while moving thru delete wing */
// 		for (dk = hmm->M; dk > k; dk--)
// 		  {
// 		    tr->statetype[tpos] = STD;
// 		    tr->nodeidx[tpos]   = dk;
// 		    tr->pos[tpos]       = 0;
// 		    tpos++;
// 		    if (tpos == curralloc) 
// 		      {				/* grow trace if necessary  */
// 			curralloc += N;
// 			P7ReallocTrace(tr, curralloc);
// 		      }
// 		  }
// 	      }

// 	    tr->statetype[tpos] = STM;
// 	    tr->nodeidx[tpos]   = k--;
// 	    tr->pos[tpos]       = i--;
// 	    break;
// 	  }
//       if (k < 0) Die("traceback failed");
//       break;

//     case STC:			/* C comes from C, E */
//       if (xmx[i][XMC] <= -INFTY) { P7FreeTrace(tr); *ret_tr = NULL; return; }
//       else if (xmx[i][XMC] == xmx[i-1][XMC] + hmm->xsc[XTC][LOOP])
// 	{
// 	  tr->statetype[tpos] = STC;
// 	  tr->nodeidx[tpos]   = 0;
// 	  tr->pos[tpos]       = 0;    /* note convention adherence: */
// 	  tr->pos[tpos-1]     = i--;  /* first C doesn't emit       */
// 	}
//       else if (xmx[i][XMC] == xmx[i][XME] + hmm->xsc[XTE][MOVE])
// 	{
// 	  tr->statetype[tpos] = STE;
// 	  tr->nodeidx[tpos]   = 0;
// 	  tr->pos[tpos]       = 0; /* E is a nonemitter */
// 	}
      
//       else Die("Traceback failed.");
//       break;

//     case STJ:			/* J connects from E, J */
//       if (xmx[i][XMJ] <= -INFTY) { P7FreeTrace(tr); *ret_tr = NULL; return; }
//       else if (xmx[i][XMJ] == xmx[i-1][XMJ] + hmm->xsc[XTJ][LOOP])
// 	{
// 	  tr->statetype[tpos] = STJ;
// 	  tr->nodeidx[tpos]   = 0;
// 	  tr->pos[tpos]       = 0;    /* note convention adherence: */
// 	  tr->pos[tpos-1]     = i--;  /* first J doesn't emit       */
// 	}
//       else if (xmx[i][XMJ] == xmx[i][XME] + hmm->xsc[XTE][LOOP])
// 	{
// 	  tr->statetype[tpos] = STE;
// 	  tr->nodeidx[tpos]   = 0;
// 	  tr->pos[tpos]       = 0; /* E is a nonemitter */
// 	}

//       else Die("Traceback failed.");
//       break;

//     default:
//       Die("traceback failed");

//     } /* end switch over statetype[tpos-1] */
    
//     tpos++;
//     if (tpos == curralloc) 
//       {				/* grow trace if necessary  */
// 	curralloc += N;
// 	P7ReallocTrace(tr, curralloc);
//       }

//   } /* end traceback, at S state; tpos == tlen now */
//   tr->tlen = tpos;
//   P7ReverseTrace(tr);
//   *ret_tr = tr;
}

int Die(char * format, ...)
{
    exit(1);
    return 0;
}
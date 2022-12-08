

#define INFTY       987654321
#define ARRAY_SIZE  1000;

#define ReallocOrDie(x,y)  sre_realloc(__FILE__, __LINE__, (x), (y))

#define MAXABET     20	        /* maximum size of alphabet (4 or 20)              */
#define XMB 0
#define XME 1
#define XMC 2
#define XMJ 3
#define XMN 4
#define XTN  0
#define XTE  1
#define XTC  2
#define XTJ  3

#define TMM  0
#define TMI  1
#define TMD  2
#define TIM  3
#define TII  4
#define TDM  5
#define TDD  6 

#define STBOGUS 0
#define STM     1
#define STD     2
#define STI     3
#define STS     4
#define STN     5
#define STB     6
#define STE     7
#define STC     8
#define STT     9
#define STJ     10   
#define INTSCALE    1000.0      /* scaling constant for floats to integer scores   */  

#define MOVE 0          /* trNB, trEC, trCT, trJB */
#define LOOP 1          /* trNN, trEJ, trCC, trJJ */

// int hi();

struct plan7_s;
struct dpmatrix_s;
struct p7trace_s;
int P7Viterbi(char *, int, struct plan7_s *, struct dpmatrix_s *, struct p7trace_s **);

void *sre_realloc(char *file, int line, void *p, size_t size);
void ResizePlan7Matrix(struct dpmatrix_s *mx, int N, int M, int ***xmx, int ***mmx, int ***imx, int ***dmx);
void P7ViterbiTrace(struct plan7_s *hmm, char *dsq, int N, struct dpmatrix_s *mx, struct p7trace_s **ret_tr);
int Die(char *, ...);

struct plan7_s {
  /* Annotation on the model. A name is mandatory.
   * Other fields are optional; whether they are present is
   * flagged in the stateflags bit array.
   * 
   * desc is only valid if PLAN7_DESC is set in flags.
   *  acc is only valid if PLAN7_ACC is set in flags.
   *   rf is only valid if PLAN7_RF is set in flags.
   *   cs is only valid if PLAN7_CS is set in flags.
   *   ca is only valid if PLAN7_CA is set in flags.
   *  map is only valid if PLAN7_MAP is set in flags.
   */
  char  *name;                  /* name of the model                    +*/
  char  *acc;			/* accession number of model (Pfam)     +*/
  char  *desc;                  /* brief description of model           +*/ 
  char  *rf;                    /* reference line from alignment 0..M   +*/
  char  *cs;                    /* consensus structure line      0..M   +*/ 
  char  *ca;			/* consensus accessibility line  0..M    */
  char  *comlog;		/* command line(s) that built model     +*/
  int    nseq;			/* number of training sequences         +*/
  char  *ctime;			/* creation date                        +*/
  int   *map;			/* map of alignment cols onto model 1..M+*/
  int    checksum;              /* checksum of training sequences       +*/

  /* The following are annotations added to support work by Michael Asman, 
   * CGR Stockholm. They are not stored in model files; they are only
   * used in model construction.
   * 
   * #=GC X-PRM (PRT,PRI) annotation is picked up by hmmbuild and interpreted
   * as specifying which mixture Dirichlet component to use. If these flags
   * are non-NULL, the normal mixture Dirichlet code is bypassed, and a
   * single specific Dirichlet is used at each position.
   */
  int   *tpri;                  /* which transition mixture prior to use */ 
  int   *mpri;                  /* which match mixture prior to use */
  int   *ipri;                  /* which insert mixture prior to use */

  /* Pfam-specific score cutoffs.
   * 
   * ga1, ga2 are valid if PLAN7_GA is set in flags.
   * tc1, tc2 are valid if PLAN7_TC is set in flags.
   * nc1, nc2 are valid if PLAN7_NC is set in flags.
   */
  float  ga1, ga2;		/* per-seq/per-domain gathering thresholds (bits) +*/
  float  tc1, tc2;		/* per-seq/per-domain trusted cutoff (bits)       +*/
  float  nc1, nc2;		/* per-seq/per-domain noise cutoff (bits)         +*/

  /* The main model in probability form: data-dependent probabilities.
   * This is the core Krogh/Haussler model.
   * Transition probabilities are usually accessed as a
   *   two-D array: hmm->t[k][TMM], for instance. They are allocated
   *   such that they can also be stepped through in 1D by pointer
   *   manipulations, for efficiency in DP algorithms.
   */
  int     M;                    /* length of the model (# nodes)        +*/
  float **t;                    /* transition prob's. t[1..M-1][0..6]   +*/
  float **mat;                  /* match emissions.  mat[1..M][0..19]   +*/ 
  float **ins;                  /* insert emissions. ins[1..M-1][0..19] +*/
  float   tbd1;			/* B->D1 prob (data dependent)          +*/

  /* The unique states of Plan 7 in probability form.
   * These are the algorithm-dependent, data-independent probabilities.
   * Some parts of the code may briefly use a trick of copying tbd1
   * into begin[0]; this makes it easy to call FChoose() or FNorm()
   * on the resulting vector. However, in general begin[0] is not
   * a valid number.
   */
  float  xt[4][2];              /* N,E,C,J extra states: 2 transitions      +*/
  float *begin;                 /* 1..M B->M state transitions              +*/
  float *end;                   /* 1..M M->E state transitions (!= a dist!) +*/

  /* The null model probabilities.
   */
  float  null[MAXABET];         /* "random sequence" emission prob's     +*/
  float  p1;                    /* null model loop probability           +*/

  /* The model in log-odds score form.
   * These are created from the probabilities by LogoddsifyHMM().
   * By definition, null[] emission scores are all zero.
   * Note that emission distributions are over 26 upper-case letters,
   * not just the unambiguous protein or DNA alphabet: we
   * precalculate the scores for all IUPAC degenerate symbols we
   * may see. Non-IUPAC symbols simply have a -INFTY score.
   *
   * Note the reversed indexing on msc, isc, tsc -- for efficiency reasons.
   * They're not probability vectors any more so we can reorder them
   * without wildly complicating our life.
   * 
   * The _mem ptrs are where the real memory is alloc'ed and free'd,
   * as opposed to where it is accessed.
   * This came in with Erik Lindahl's altivec port; it allows alignment on
   * 16-byte boundaries. In the non-altivec code, this is just a little
   * redundancy; tsc and tsc_mem point to the same thing, for example.
   * 
   * Only valid if PLAN7_HASBITS is set.
   */
  int  **tsc;                   /* transition scores     [0.6][1.M-1]       -*/
  int  **msc;                   /* match emission scores [0.MAXCODE-1][1.M] -*/
  int  **isc;                   /* ins emission scores [0.MAXCODE-1][1.M-1] -*/
  int    xsc[4][2];             /* N,E,C,J transitions                      -*/
  int   *bsc;                   /* begin transitions     [1.M]              -*/
  int   *esc;			/* end transitions       [1.M]              -*/
  int  *tsc_mem, *msc_mem, *isc_mem, *bsc_mem, *esc_mem;

  /* DNA translation scoring parameters
   * For aligning protein Plan7 models to DNA sequence.
   * Lookup value for a codon is calculated by pos1 * 16 + pos2 * 4 + pos3,
   * where 'pos1' is the digitized value of the first nucleotide position;
   * if any of the positions are ambiguous codes, lookup value 64 is used
   * (which will generally have a score of zero)
   * 
   * Only valid if PLAN7_HASDNA is set.
   */
  int  **dnam;                  /* triplet match scores  [0.64][1.M]       -*/
  int  **dnai;                  /* triplet insert scores [0.64][1.M]       -*/
  int    dna2;			/* -1 frameshift, doublet emission, M or I -*/
  int    dna4;			/* +1 frameshift, doublet emission, M or I -*/

  /* P-value and E-value statistical parameters
   * Only valid if PLAN7_STATS is set.
   */
  float  mu;			/* EVD mu       +*/
  float  lambda;		/* EVD lambda   +*/

  int flags;                    /* bit flags indicating state of HMM, valid data +*/
};

struct dpmatrix_s {
  int **xmx;			/* special scores [0.1..N][BECJN]     */
  int **mmx;			/* match scores [0.1..N][0.1..M]      */
  int **imx;			/* insert scores [0.1..N][0.1..M-1.M] */
  int **dmx;			/* delete scores [0.1..N][0.1..M-1.M] */

  /* Hidden ptrs where the real memory is kept; this trick was
   * introduced by Erik Lindahl with the Altivec port; it's used to
   * align xmx, etc. on 16-byte boundaries for cache optimization.
   */
  void *xmx_mem, *mmx_mem, *imx_mem, *dmx_mem;

  /* The other trick brought in w/ the Lindahl Altivec port; dp matrix
   * is retained and grown, rather than reallocated for every HMM or sequence.
   * Keep track of current allocated-for size in rows (sequence length N)
   * and columns (HMM length M). Also keep track of pad sizes: how much
   * we should overallocate rows or columns when we reallocate. If pad = 0,
   * then we're not growable in this dimension.
   */
  int maxN;			/* alloc'ed for seq of length N; N+1 rows */
  int maxM;			/* alloc'ed for HMM of length M; M+1 cols */

  int padN;			/* extra pad in sequence length/rows */
  int padM;			/* extra pad in HMM length/columns   */
};

/* Declaration of Plan7 shadow matrix structure.
 * In general, allowed values are STM, STI, etc.
 * However, E state has M possible sources, from 1..M match states;
 * hence the esrc array.
 */
struct dpshadow_s {
  char **xtb;			/* special state traces [0.1..N][BECJN]     */
  char **mtb;			/* match state traces [0.1..N][0.1..M]      */
  char **itb;			/* insert state traces [0.1..N][0.1..M-1.M] */
  char **dtb;			/* delete state traces [0.1..N][0.1..M-1.M] */
  int   *esrc;                  /* E trace is special; must store a M state number 1..M */
};

struct p7trace_s {
  int   tlen;                   /* length of traceback                          */
  char *statetype;              /* state type used for alignment                */
  int  *nodeidx;                /* index of aligned node, 1..M (if M,D,I), or 0 */
  int  *pos;                    /* position in dsq, 1..L, or 0 if none          */ 
};
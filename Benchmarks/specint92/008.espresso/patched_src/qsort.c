/*
 * Copyright 1988 MIPS Computer Systems Inc.  All Rights Reserved.
 *
 * Permission to use, copy, modify, and distribute this software and
 * its documentation for any purpose and without fee is hereby
 * granted, provided that the above copyright notice appear in all
 * copies and that both that copyright notice and this permission
 * notice appear in supporting documentation, and that the name of
 * MIPS not be used in advertising or publicity pertaining to
 * distribution of the software without specific, written prior
 * permission.  MIPS makes no representations about the suitability of
 * this software for any purpose.  It is provided "as is" without
 * express or implied warranty or support of any kind.
 */

/* qsort.c, Earl Killian, 29 November 1988 */
/* This is a replacement for the libc qsort() that is specialized
   for sorting data with size equal to sizeof(char **). */

/* Included as part of espresso benchmark on Rick Spickelmier's
   suggestion (ricks@shambhala.berkeley.edu), because different qsort
   algorithms could get different results on different machines. */

typedef char *pointer;

/* IMPACT_FIX */
#if defined(_HPUX_SOURCE) || defined(linux)
void
#else
int
#endif
qsort (a, n, size, order)
    register pointer *a;
    register int n;
    register int size;
    register int (*order)();
{
  register pointer *i, *j, *m, pi, pj, pm;
  pointer v;

  if (size != sizeof(pointer)) abort();

  while (n > 4) {

    /* Find value to partition about.  Use median of 3 approach. */
    /* Leave the 3 properly ordered. */
    i = a;
    j = a + n - 1;
    m = a + (n >> 1);
    pi = *i;
    pj = *j;
    pm = *m;
    if ((*order)(i, j) <= 0) {
      /* Ki <= Kj */
      if ((*order)(m, i) <= 0) {
	/* Km <= Ki <= Kj */
	v = pi;
	*i = pm;
      }
      else if ((*order)(j, m) < 0) {
	/* Ki <= Kj < Km */
	v = pj;
	*j = pm;
      } else {
	/* Ki <= Km <= Kj */
	v = pm;
      }
    }
    else {
      /* Kj < Ki */
      if ((*order)(m, j) < 0) {
	/* Km < Kj < Ki */
	v = pj;
	*j = pi;
	*i = pm;
      }
      else if ((*order)(i, m) < 0) {
	/* Kj < Ki < Km */
	v = pi;
	*i = pj;
	*j = pm;
      }
      else {
	/* Kj <= Km <= Ki */
	v = pm;
	*i = pj;
	*j = pi;
      }
    }
    i += 1;
    *m = *i;

    /* Partition about median value. */
    for (;;) {
      /* *i empty, find something to fill it with */
      do {
	j -= 1;
	if (j == i) goto exitloop;
      } while ((*order)(&v, j) < 0);
      *i = *j;
      /* *j empty, find something to fill it with */
      do {
	i += 1;
	if (i == j) goto exitloop;
      } while ((*order)(i, &v) < 0);
      *j = *i;
    }
exitloop:
    *i = v;

    /* Now sort sections before and after partition.  This is conceptually
       two recursive calls to ourself.  The tail-recursion of the second
       call is implemented by iteration.  Do the smallest section first
       to guarentee log(N) stack size. */
    if (i < m) {
      if (i - 1 != a) {
	qsort (a, i - a, sizeof(pointer), order);
      }
      n = (a + n) - (i + 1);
      a = i + 1;
    }
    else {
      if (i + 1 != a + n) {
	qsort (i + 1, (a + n) - (i + 1), sizeof(pointer), order);
      }
      n = i - a;
    }
  }

  if (n <= 1) return;

  /* use insertion sort to clean up small subsections */
  i = a + 1;
  j = a + n;
  do {
    v = i[0];
    if ((*order)(i - 1, &v) > 0) {
      do {
	i[0] = i[-1];
	i -= 1;
      } while (i != a && (*order)(i - 1, &v) > 0);
      i[0] = v;
    }
    i += 1;
  } while (i != j);
}

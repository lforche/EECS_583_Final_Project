/* IMPACT_FIX */
#define VERSION 0
#define COMPDATE ""
#define CFLAGS ""
/*
 *
 *	Copyright (C) 1981, Regents of the University of California
 *
 *	All rights reserved
 *
 */

#include <stdio.h>

/*
 * print program version number, compile date/time, compile options
 * these must be passed in through cc -D options
 */

extern char *ego;

version()
{
	fprintf (stderr, "%s: version: %d, compiled: %s, cflags: %s\n",
		ego, VERSION, COMPDATE, CFLAGS);
	return;
}

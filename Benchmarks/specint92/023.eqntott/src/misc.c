/*
 *
 *	Copyright (C) 1981, Regents of the University of California
 *
 *	All rights reserved
 *
 */

/*
 * store
 */

char *
store (s)
register char *s;
{
	register unsigned len = strlen (s) + 1;
	char *calloc();
	register char *t = calloc (len, sizeof (char *));
	char *tt = t;

	while (*t++ = *s++);
	return (tt);
}

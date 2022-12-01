/*
 *			Lyon's Cochlear Model, The Program
 *	   			   Malcolm Slaney
 *			     Advanced Technology Group
 *				Apple Computer, Inc.
 *				 malcolm@apple.com
 *				   November 1988
 *
 *	This program implements a model of acoustic propagation and detection
 *	in the human cochlea.  This model was first described by Richard F.
 *	Lyon.  Please see 
 *		Malcolm Slaney, "Lyon's Cochlear Model, the Mathematica 
 *		Notebook," Apple Technical Report #13, 1988
 *	for more information.  This report is available from the Apple 
 *	Corporate Library.
 *
 *	Warranty Information
 *	Even though Apple has reviewed this software, Apple makes no warranty
 *	or representation, either express or implied, with respect to this
 *	software, its quality, accuracy, merchantability, or fitness for a 
 *	particular purpose.  As a result, this software is provided "as is,"
 *	and you, its user, are assuming the entire risk as to its quality
 *	and accuracy.
 *
 *	Copyright (c) 1988-1989 by Apple Computer, Inc
 *
 * Revision 1.0  Original SPEC Version
 * 
 *
 */

static char     *RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/comm.c,v 1.1 2002/10/05 19:42:58 ntclark Exp $";

/*
 *	This routine provides a simple means for searching for an argument
 *	name in a table.argument parsing.
 */
#include	<stdio.h>

comm(char *s, char **table)
{
	register	int	i,j,r;

	for(i=0;table[i];i++){
		for (j=0;(r=table[i][j]) == s[j] && r;j++);
		if (r == 0 && s[j] == '=' )
			return(i+1);
	}
	fprintf(stderr,"bad option: %s\n",s);
	syntax();
	exit(1);
}

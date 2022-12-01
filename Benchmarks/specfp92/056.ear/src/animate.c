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
 * Initial SPEC release - all implementation-specific code has been removed.
 * 
 *
 */

static char	*RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/animate.c,v 1.2 2009/02/18 03:23:38 mehrara Exp $";

/*
 *	Animate - A simple example showing the use of the Ultra Frame Buffer
 *	on the Cray at Apple.
 *
 *	By
 *		Malcolm Slaney (documentation and cleanup)
 *		Sam Dicker (programming and brains)
 *
 *	This example is made up of five files.  This file (animate.c) generates
 *	a large array of floating point data (a diagonal sine wave across the
 *	screen).  Various parts of this array are displayed on the Ultra Frame 
 *	Buffer as fast as possible to get the effect of animation.
 *
 *	A Fortran routine called ftopix converts the array of data into black
 *	and white pixels on the screen.  
 *	
 *	The Makefile for this example is included along with the include file
 *	ub.h and the directives to the segment loader (segdir)
 */
#include <stdio.h>
#include <math.h>			/* To get the sin defintion */
#include "ub.h"				/* To get the Frame Buffer size */

#ifdef	MAIN

#define	XSIZE 512			/* Size of data array */
#define	YSIZE (2*XSIZE)			/* Size of data array */

float amp[YSIZE][XSIZE];		/* Array to hold test data */

main()
{
    register int i, j;

					/* Create a diagonal sine wave */
    for (j = 0; j < YSIZE; j++)
	for (i = 0; i < XSIZE; i++)
	    amp[j][i] = sin((i+j)*2.0*3.1415926/XSIZE);

    InitDisplay();			/* Allocate incore frame buffers/CPUs */

    for (i = 0; ; i = (i+13)%XSIZE)	/* Loop forever displaying image */
	UpdateDisplay(amp[i],XSIZE,XSIZE,-1.0,1.0);
}
#endif	/* MAIN */

int	*fb[2];				/* Pointers to incore screen buffers */
int	 buf = 0;			/* Which buffer is being filled(0 or 1*/

/* 
 *	InitDisplay - This routine allocates two full screen buffers that
 *	will hold the pixel data.  In addition it reserves 4 CPUs for later
 *	use by the ftopix routine (if it is compiled with microtasking enabled.)
 */
#ifndef LLVM //mehrara 2/2009. Empty functions breaks out passes in LLVM
InitDisplay(void)
{
}
/*	
 *	UpdateDisplay - Dump an array of data (amps) with dimensions given 
 *	by (width, height) to the Ultra Frame Buffer.  Min and max are the 
 *	minimum and maximum of the data.
 */

UpdateDisplay(float *amps, int width, int height, float min, float max)
{
}
AnnotateDisplay(int *ub, char *string)
{
}
SetDisplayValue(int value)
{
}
#endif

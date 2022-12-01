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
 * 
 *
 */

#include	<math.h>

typedef struct {
	float real;
	float im;
} complex;

#ifndef PI
#define PI 3.141592653589792434
#endif  /* PI */


extern	float	fmax(), fmin();
extern	float	real(complex a), aimag(complex a), cmag(complex c), cphase(complex c), cmag2(complex c);
extern	complex	cadd(complex a, complex b), csub(complex a, complex b), cmul(complex a, complex b), cdiv(complex a, complex b), cmplx(float a, float b), csqrt(complex x), conjugate(complex x);
extern	complex	iToPower(int m), cexp(complex x), cis(float theta);

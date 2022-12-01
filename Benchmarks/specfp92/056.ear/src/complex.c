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
 */

static char     *RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/complex.c,v 1.1 2002/10/05 19:42:58 ntclark Exp $";

/*
 *	This file provides several routines to make it easier to work with
 *	complex numbers.  Complex numbers are only used to calculate the
 *	filter coefficients.  During the actual processing all numbers are
 *	real.
 */

#include	"complex.h"

#if	MAIN || DEBUG
#define	PrintResult2(func,a,b,c) printf("%s[(%g,%g),(%g,%g)] = (%g,%g)\n", \
					func, \
					a.real, a.im, b.real, b.im, \
					c.real, c.im);
#define	PrintResult1(func,a,c)	 printf("%s[(%g,%g)] = (%g,%g)\n", \
					func, \
					a.real, a.im, \
					c.real, c.im);
#define	PrintResult(func,a,c)	 printf("%s[(%g,%g)] = %g\n", \
					func, \
					a.real, a.im, c);
#else
#define	PrintResult2(func,a,b,c) ;
#define	PrintResult1(func,a,c) ;
#define	PrintResult(func,a,c) ;
#endif

complex	cmul(complex a, complex b)
{
	complex c;
	c.real = a.real*b.real - a.im*b.im;
	c.im = a.real*b.im + a.im*b.real;
	PrintResult2("cmul",a,b,c);
	return(c);
}

complex	cadd(complex a, complex b)
{
	complex	c;
	c.real = a.real+b.real;
	c.im = a.im+b.im;
	PrintResult2("cadd",a,b,c);
	return(c);
}

complex	csub(complex a, complex b)
{
	complex	c;
	c.real = a.real-b.real;
	c.im = a.im-b.im;
	PrintResult2("csub",a,b,c);
	return(c);
}

complex	cdiv(complex a, complex b)
{
	float	mag;
	complex	c;

	mag = b.real*b.real + b.im*b.im;
	c.real = (a.im*b.im + a.real*b.real)/mag;
	c.im = (a.im*b.real - a.real*b.im)/mag;

	PrintResult2("cdiv",a,b,c);
	return(c);
}

complex	cmplx(float a, float b)
{
	complex	c;
	c.real = a;
	c.im = b;
	return(c);
}

float	real(complex a)
{
	return(a.real);
}

float	aimag(complex a)
{
	return(a.im);
}

float	cmag(complex c)
{
	return(sqrt(c.real*c.real + c.im*c.im));
}

float cmag2(complex c)
{
	return(c.real*c.real+c.im*c.im);
}

float	cphase(complex c)
{
	return(atan2(c.im,c.real));
}

/*
	Complex Square Root

	Use the polar representation since the quadractic solution 
	doesn't always work.
*/
complex	csqrt(complex x)
{
	register	float	angle, mag;

	angle = atan2(x.im,x.real);
	mag = sqrt(x.real*x.real + x.im*x.im);
	mag = sqrt(mag);
	angle /= 2.0;
	return(cmplx(mag*cos(angle),mag*sin(angle)));
}

complex conjugate(complex x)
{
	return(cmplx(x.real,-x.im));
}

complex iToPower(int m)
{
	switch (m%4) {
	case 0:
		return(cmplx(1.0,0.0));
	case 1:
		return(cmplx(0.0,1.0));
	case 2:
		return(cmplx(-1.0,0.0));
	case 3:
		return(cmplx(0.0,-1.0));
	}
}

complex	cexp(complex x)
{
	float	mag;

	mag = exp(x.real);

	return(cmplx(mag*cos(x.im),mag*sin(x.im)));
}

complex cis(float theta)
{
	return(cmplx(cos(theta), sin(theta)));
}

printcomplex(complex c)
{
	printf("(%g,%g)",c.real,c.im);
}

#ifdef	MAIN

complex	a,b;

#define	testc2(func,string)	printf("%s[(%g,%g),(%g,%g)] = ", \
					string,a.real, a.im, b.real, b.im); \
				printcomplex(func(a,b)); \
				printf("\n");
#define	testc1(func,string)	printf("%s[(%g,%g)] = ", \
					string,a.real, a.im); \
				printcomplex(func(a)); \
				printf("\n");
#define	testc(func,string)	printf("%s[(%g,%g)] = %g\n", \
					string,a.real, a.im, func(a));


main(){

	a = cmplx(1.0,2.0);
	b = cmplx(-2.0,1.0);

#ifdef	FULL
	testc2(cadd,"cadd");
	testc2(cmul,"cmul");
	testc2(csub,"csub");
	testc2(cdiv,"cdiv");
	testc(real,"real");
	testc(aimag,"aimag");
	testc(cmag,"cmag")
	testc(cmag2,"cmag2");
	testc(cphase,"cphase");
	testc1(cexp,"cexp");
	testc1(csqrt,"csqrt");
	testc1(conjugate,"conjugate");
#endif	FULL
	printcomplex(cdiv(cadd(a,b),cmul(csub(b,a),cdiv(b,a))));
	printf("\n");
}

#endif	/* MAIN */

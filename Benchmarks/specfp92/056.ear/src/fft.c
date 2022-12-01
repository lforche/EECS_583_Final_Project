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
 */

static char     *RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/fft.c,v 1.1 2002/10/05 19:42:58 ntclark Exp $";

#include	<math.h>
float   fftzero = 0.0 ;
float *
initfft(int Size)
{
	return((float *) &fftzero);
}


/*
	fft - calculate FFT

	Carl Crawford
	Purdue University
	W. Lafayette, IN. 47907

	Calling Sequence....fft(real,im,m,iopt)
	Where real and im are the real and imaginary
	parts of the input data.  The result is
	returned in place.  M is the log base 2
	of the number of elements in the array.
	Iopt is equal to 0 for the forward
	transform and 1 for the inverse transform.
*/
fft(float *a, float *b, int m, int iopt)
	     	    	/* real part of data */
	     	    	/* imaginary part of data */
	   	  	/* size of data = 2**m */
	   	     	/* 0=dft, 1=idft */
{
	int	nv2,nm1,n,le,le1,ip;
	float   pi,pile1,tmp;
	float	ua,ub,wa,wb,ta,tb,*ap,*bp;
	register	i,j,l;

	n = 1<<m;
	if(iopt){
		for(i=0,ap=a,bp=b;i<n;i++){
			*ap++ /= n;
			*bp++ /= -n;
		}
	}
	nv2 = n/2;
	nm1 = n - 1;
	j = 0;
	for(i=0;i<nm1;i++){
		if(i<j){
			ta = a[j];	tb = b[j];
			a[j] = a[i];	b[j] = b[i];
			a[i] = ta;	b[i] = tb;
		}
		l = nv2;
		while(l < (j+1) ){
			j = j - l;
			l = l / 2;
		}
		j = j + l;
	}
	pi = 3.1415926535;
	for(l=1;l<=m;l++){
		le = 1<<l;
		le1 = le>>1;
		ua = 1.0;	ub = 0.0;
		pile1 = pi / le1;
		wa = cos(pile1);	wb = -sin(pile1);
		for(j=0;j<le1;j++){
			for(i=j;i<n;i += le){
				ip = i + le1;
				ta = a[ip] * ua - b[ip] * ub;
				tb = a[ip] * ub + b[ip] * ua;
				a[ip] = a[i] - ta;
				b[ip] = b[i] - tb;
				a[i] += ta;
				b[i] += tb;
			}
			ua = (tmp = ua) * wa - ub * wb;
			ub = tmp * wb + ub * wa;
		}
	}
						/* For the inverse transform
						 * scale the result by N
						 */
	if(iopt != 0){
		for(i=0;i<n;i++)
			b[i] = -b[i];
	}
}




#ifdef	MAIN

#define	N	16
#define	logN	4

float	a[N], b[N];

main(){
	int	i;

	a[1] = 1.0;
	a[N-1] = 1.0;

	for (i=0;i<N;i++)
		printf("%d:	%g	%g\n", i, a[i], b[i]);
	fft(a,b,logN,1);
	for (i=0;i<N;i++)
		printf("%d:	%g	%g\n", i, a[i], b[i]);

	fft(a,b,logN,0);
	for (i=0;i<N;i++)
		printf("%d:	%g	%g\n", i, a[i], b[i]);
}
#endif	/* MAIN */

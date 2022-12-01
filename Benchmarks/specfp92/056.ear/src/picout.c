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

static char     *RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/picout.c,v 1.1 2002/10/05 19:42:58 ntclark Exp $";

/*
 *	Debugging file output.
 */

#include	<stdio.h>
#include	"earhdr.h"

picout(char *name, float *pic, long int num)
{
	int	output;

#ifndef	TEXTOUTPUT
	if ((output = creat(name,0644)) >= 0){
		num *= sizeof(*pic);
		if (write(output,pic,(unsigned int)num) != num){
			extern int	errno;
			printf("Error %d in the write of %ld bytes to %s.\n", 
				errno, (long)num, name);
			exit(0);
		}
		close(output);
	} 
#else	/* !TEXTOUTPUT */
	FILE	*fp;
	
	if ((fp = fopen(name,"w")) != NULL){
		int	i;
		for (i=0;i<num;i++){
			fprintf(fp,"%g\t",pic[i]);
			if (i%4 == 3)
				fprintf(fp,"\n");
		}
		fprintf(fp,"\n");
		fclose(fp);
	}
#endif	/* TEXTOUTPUT */
	else {
		fprintf(stderr, "Couldn't open %s for creating picture output.\n",
				name);
		exit(1);
	}
}

BytePicout(char *name, float *pic, long int num, float min, float max)
{
	FILE	*fp;
	register int	ch;
	register int32	i;
	register float	gain = 255.0/(max-min);
	
	if (fp = fopen(name,"w")){
		for (i=0;i<num;i++,pic++){
			ch = (*pic - min)/(max-min)*255;
			if (ch < 0)
				putc(0,fp);
			else if (ch > 254)
				putc(255,fp);
			else
				putc(ch,fp);
		}
		fclose(fp);
	}
	else {
		fprintf(stderr, "Couldn't open %s for creating picture output.\n",
				name);
		exit(1);
	}
}
	
	
	
	
#ifdef	MAIN

#include	<math.h>
float	a[64][64];

main(){
	int	i, j;

	for (i=0;i<64;i++)
		for (j=0;j<64;j++){
			float	radius;
			radius = sqrt((float)i*i+j*j);
			a[i][j] = sin(radius/4.0)*(1-radius/128.0);
		}
	picout("sin.pic",a,64*64);
}

#endif	/* MAIN */

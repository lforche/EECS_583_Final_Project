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

/*
 *	Output formats.
 *	This code supports a number of different output formats.  You should
 *	define one of the following formats and undef the rest.  These options
 *	determine the style of output for the cochleagram and the correlagram.
 *	
 *	Header Formats
 *	First determine whether there should be a header on the files.  The
 *	best supported is NOHEADER.  The OGC people wanted a different format
 *	based on the CMU syncrep format.
 *	
 *	In the NOHEADER format the data is output in the order which it is
 *	computed.  The cochleagram output is written 84 channels per time
 *	step with channels ordered from high frequency to low (base to
 *	apex of the cochlea.)  The correlagram output is one two dimensional
 *	time step per file.  Each file has the autocorrelation of each
 *	channel written in order from base to apex.  The output value is
 *	the zero lag for channel 0 (at the base),  the second value is the
 *	autocorrelation output for a time lag of one sample interval of the
 *	channel 0.
 *	
 */
#define	NOHEADER 		/* Define Simplest Output File Format */
#undef	OGC			/* Let's do it the OGC way */

/*
 *	Data Formats
 *	There are three different styles of output data.  Which one you should
 *	use depends on what you are going to do with the data.  If you are
 *	going to read the data with custom written software than binary 
 *	floating point is fastest.  If you are going to look at the output
 *	using an editor than ASCII text output is best.  If you are going
 *	to use an image display program than 8 bit byte output will be the
 *	most natural.
 *	
 *	Both the cochleagram and the correlagram are output in the format
 *	specified below.
 *	FLOATOUTPUT - Output the data in the machine's native binary floating
 *		point format.  This is the fastest method of IO since the data
 *		is copied directly from the array to the output file.  This is
 *		the default action.
 *	TEXTOUTPUT - Convert the data into ASCII and output the results in 
 *		a readable format.  This format is useful for reading the
 *		data in editors and programs like spreadsheets that want the
 *		data in a human readable format.  This option is often nice
 *		when verifying the output of the program.
 *	BYTEOUTPUT - Convert the data into 8 bit unsigned bytes for display 
 *		by a B&W display program.  Both the cochleagram and the 
 *		correlagram outputs are always non negative so a zero byte
 *		is zero.  The maximum output value (255) is a function of
 *		the final AGC target value.
 */
#undef	FLOATOUTPUT			/* Binary Floating Point Output */
#undef	TEXTOUTPUT			/* Readable ASCII Text Output */
#define	BYTEOUTPUT			/* 8 Bit Unsigned Byte Output */


/*
 *	The definitions that follow are not for user configuration.  You
 *	shouldn't change any of the following parameters unless you know
 *	what you are doing.
 */

#ifndef	NULL
#include <stdio.h>
#endif /* NULL */
/*  ???   #include        "timer.h"     */


#ifndef	int32
#define	int32	long
#endif

#define	MaxN 128

#define	EAR_LENGTH		88
#define	LOG_RESPONSE_LENGTH	8
#define	RESPONSE_LENGTH		(1<<LOG_RESPONSE_LENGTH)


#ifndef	PI
#define	PI 3.141592653589792434
#endif	/* PI */


#define	SystemCursor()	;


	float	AMAX(), AMIN();

					/* Global State
					 * Used by the rest of the programs 
					 * Mostly definited in utilities.c
					 */


	int	Debug  =  0  ;
	int	printflag  =  1  ;
	int	ImpulseInput  =  0  ;
	int	UseAgc  =  1  ;
	int	UseCascade  =  1  ;
	int	UseDifference  =  1  ;
	int	CalculateResponse  =  0  ;
	int	ComputeFiltered  =  0  ;
	int	UseUltra  =  0  ;
	int	CPUs  =  4  ;
	int	VideoRecord  =  0  ;
	char	*progname;
	char	*ifn  =  "data.adc"  ;		/* Input File Name */
	char	*ofn  =  "cochlea.pic"  ;		/* Output File for Cochleagram */
	char	*ffn  =  NULL  ;			/* Filtered Output */
	char	*cfn  =  NULL  ;			/* Correlagram Directory Name */

	float	sample_rate  =  16000.0  ;
	int32	DataLength;
	int32	MaxSamples  =  -1  ;

	float	AgcStage1Tau  =  0.640  ;
	float	AgcStage2Tau  =  0.16  ;
	float	AgcStage3Tau  =  0.04  ;
	float	AgcStage4Tau  =  0.01  ;
	float	AgcStage1Target  =  0.0032  ;
	float	AgcStage2Target  =  0.0016  ;
	float	AgcStage3Target  =  0.0008  ;
	float	AgcStage4Target  =  0.0004  ;
	int	DecimationFactor  =  20  ;
	int	CorrelationStep  =  128  ;
	int	CorrelationLags  =  256  ;
	float	TauFactor  =  3.0  ;
	float	Normalization  =  .75  ;
	float	UltraHeadroom  =  1.0  ;
#define IMPULSE_HEIGHT	0.1
	float	ImpulseHeight  = IMPULSE_HEIGHT  ;
	float	ImpulseZero  = 0.0  ;

	float	EarBreakFreq  =  1000.0  ;
	float	EarQ  =  8.0  ;
	float	EarStepFactor  =  .25  ;
	float	EarSharpness  =  5.0  ;
	float	EarZeroOffset  =  1.5  ;
	float	EarPreemphCorner  =  300.0  ;

	float AgcEpsilon1, AgcEpsilon2, AgcEpsilon3, AgcEpsilon4;
	float a0[2*MaxN], a1[2*MaxN], a2[2*MaxN], b1[2*MaxN], b2[2*MaxN];
	float DecimationEpsilon;

	float	Output[MaxN];
	int	EarLength  =  MaxN  ;
	int	SampleNumber  =  0  ;

	FILE	*ffp;

	float	EarCorrelation(float *Output, int Lags);

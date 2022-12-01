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

static char     *RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/eardesign.c,v 1.1 2002/10/05 19:42:58 ntclark Exp $";

/*
 *	This file designs the filters used to model the cochlea.
 *	Compile with -DMAIN to test these functions.
 */

#include        <stdlib.h>
#include	<stdio.h>
#include	"complex.h"
#include	"filter.h"
#include	"earhdr.h"

/*
 *	AllocatePolynomial - Create a polynomial structure of the given order
 *	(leave room for order+1 coefficients.)
 */
struct polynomial *AllocatePolynomial(int order)
{
	struct polynomial *pp;

	pp = (struct polynomial *)calloc(1,sizeof(*pp));
	if (!pp){
		fprintf(stderr, 
		"AllocatePolynomial: Couldn't allocate polynomial structure.\n"
			);
		exit(1);
	}
	pp->order = order;
	pp->coeff = (float *)calloc(order+1, sizeof(float));
	if (!pp->coeff){
	    fprintf(stderr, 
	    "AllocatePolynomial: Couldn't allocate space for polynomial list.\n"
		);
	    exit(1);
	}
	pp->coeff[order] = 1.0;
	return(pp);
}

/*
 *	PrintPolynomial - Pretty print a polynomial structure.
 */
PrintPolynomial(struct polynomial *pp)
{
	register int	i;

	if (pp) {
		for (i=0;i<pp->order+1;i++){
			if (i == 0 || pp->coeff[i] != 1.0)
				printf("%g", pp->coeff[i]);
			if (i == 1)
				printf("z");
			else if (i > 1)
				printf("z**%d",i);
			if (i != pp->order)
				printf(" + ");
		}
	} else
		printf("1");
}

/*
 *	Evaluate a polynomial (in Z) for any complex value of z.  If the
 *	polynomial is null then return 1.0.
 */
complex PolyEval(struct polynomial *pp, complex x)
{
	register int	i;
	complex xpow, y;

	if (!pp)
		return (cmplx(1.0,0.0));

	xpow = cmplx(1.0,0.0);
	y = cmplx(0.0,0.0);

	for (i=0;i<pp->order+1;i++){
		y = cadd(y,cmul(xpow,cmplx(pp->coeff[i],0.0)));
		xpow = cmul(xpow,x);
	}
	return(y);
}

/*
 *	MakeFilter - Create a filter from feed forward (zeros) and feedback
 *	(poles) polynomials.  The user specifies the sampling rate (after all
 *	we are in the z domain) and a frequency and desired gain at that 
 *	frequency.  The coefficients of all numerator terms are adjusted so
 *	that the filter has the proper gain.
 */
struct filter *MakeFilter(struct polynomial *forward, struct polynomial *feedback, float fsamp, float freq, float gain)
{
	struct filter *fp;
	int	i;


#ifdef  DEBUG
	printf("MakeFilter called with (");
	PrintPolynomial(forward);
	printf(", ");
	PrintPolynomial(feedback);
	printf(", %g, %g, %g\n", fsamp, freq, gain);
#endif  /* DEBUG */


	fp = (struct filter *)calloc(1,sizeof(*fp));
	if (!fp){
		fprintf(stderr, 
		": Couldn't allocate coefficient structure.\n");
		exit(1);
	}
	if (forward)
		fp->forward = forward;
	else
		fp->forward = forward = AllocatePolynomial(0);
	if (feedback)
		fp->feedback = feedback;
	else
		fp->feedback = feedback = AllocatePolynomial(0);
	fp->sample_rate = fsamp;
	fp->gain = gain;
	fp->freq = freq;
	gain = gain / cmag(FilterGain(fp,fp->freq));
	for (i=0;i<forward->order+1;i++)
		forward->coeff[i] *= gain;
	return(fp);
}

/*
 *	FilterEval - Evaluate the value of a filter function (ratio of 
 *	polynomials) at a given z.
 *
 *	We use the temporary variables a and b to make it simpler on the
 *	compiler.  At least two compilers I have tried this on (Cray and
 *	Mac MPW) can't handle the more direct approach.
 */
complex FilterEval(struct filter *fp, complex z)
{
	complex a,b;
	a = PolyEval(fp->forward,z);
	b = PolyEval(fp->feedback,z);
	return(cdiv(a,b));
}

/*	FilterGain - Evaluate the gain of a filter function (ratio of 
 *	polynomials in z) at a given frequency.
 */
complex FilterGain(struct filter *fp, float freq)
{
	return(FilterEval(fp, cis(2*PI*freq/fp->sample_rate)));
}

/*
 *	FilterNumeratorCoeff - Return the i'th coefficient of the numerator
 *	of a filter.
 */
float
FilterNumeratorCoeff(struct filter *fp, int i)
{
	struct polynomial *pp;

	pp = fp->forward;
	if (i <= pp->order)
		return(pp->coeff[i]);
	else
		return(0.0);
}

/*
 *	FilterDenominatorCoeff - Return the i'th coefficient of the denominator
 *	of a filter.
 */
float
FilterDenominatorCoeff(struct filter *fp, int i)
{
	struct polynomial *pp;

	pp = fp->feedback;
	if (i <= pp->order)
		return(pp->coeff[i]);
	else
		return(0.0);
}

/*
 *	PrintFilter - Pretty print a filter structure.
 */
PrintFilter(struct filter *fp)
{
	float gain;

	printf("\t");
	PrintPolynomial(fp->forward);
	printf(" / ");
	PrintPolynomial(fp->feedback);
	printf("\n");
	printf("\tSampling rate of %g, desired gain is %g at %g hz.\n",
		fp->sample_rate, fp->gain, fp->freq);
	gain = cmag(FilterGain(fp, fp->freq));
	printf("\tActual gain is %g at %g.\n", gain, fp->freq);
}

/*
 *	The following is a bunch of parameters that describe the ear model.
 *	See the technical report for details and explanations.
 */
extern float EarBreakFreq;
extern float EarQ;
extern float EarStepFactor;
extern float EarZeroOffset;
extern float EarSharpness;
extern float EarPreemphCorner;

/*
 *	EarBandwidth - How wide are the poles of a stage in the ear filter.
 *	The result is in Hz.
 */
float EarBandwidth(float cf)
{
	return(sqrt(cf*cf + EarBreakFreq*EarBreakFreq)/EarQ);
}
	
/*
 *	CascadeZeroCF - What frequency are the zeros at in a stage of the
 *	ear filter.  The result is a small factor of the step size between 
 *	channels (EarBandwidth * EarStepFactor)
 */
float CascadeZeroCF(float cf)
{
	return( cf + EarBandwidth(cf) * EarStepFactor * EarZeroOffset);
}

/*
 *	CascadeZeroQ - What is the quality factor of a zero in a stage
 *	of the ear filter.
 */
float CascadeZeroQ(float cf)
{
	return(EarSharpness * CascadeZeroCF(cf) / EarBandwidth(cf));
}

/*
 *	CascadePoleCF - What is the center frequency of the poles of each
 *	stage of the cascade filter bank?
 */
float CascadePoleCF(float cf)
{
	return(cf);
}

/*
 *	CascadePoleQ - What is the quality factor of the poles?
 */
float CascadePoleQ(float cf)
{
	return(cf / EarBandwidth(cf));
}

/*
 *	MaximumEarCF - What is the maximum frequency for a pole in the
 *	cascade-only ear model.  This is a function of the Nyquist frequency,
 *	the location of the zero in the first full stage and the width of
 *	each channel.
 */
float MaximumEarCF(float fs)
{
	float	topf = fs / 2.0;

	return( (topf - (CascadeZeroCF(topf) - topf)) + 
		EarBandwidth(topf) * EarStepFactor);
}

/*
 *	EarChannelCF - Compute the center frequency of each channel of the
 *	ear filter bank.  We use the EarChannel array to cache the results
 *	so that we don't need to recompute them everytime.
 */
#define	MaxChannels	256
static	float	EarChannelCFResults[MaxChannels];

float EarChannelCF(int index, float fs)
{
	if (index >= 0 && index < MaxChannels && EarChannelCFResults[index] != 0.0)
		return EarChannelCFResults[index];
	if (index == 0)
		return EarChannelCFResults[index] = MaximumEarCF(fs);
	else {
		float	cf, result;
		cf = EarChannelCF(index-1, fs);
		result = cf - EarStepFactor*EarBandwidth(cf);
		if (index >= 0 && index < MaxChannels)
			EarChannelCFResults[index] = result;
		return(result);
	}
}


/* EpsilonFromTauFS
 *	Compute coefficient in follower-integrator filter (one minus pole)
 */

float EpsilonFromTauFS(float tau, float fs)
{
	return (1.0 - exp(-1.0/tau/fs));
}

/* 
 *	FirstOrderFromTau - Polynomial coefficient list for first-order 
 *	pole or zero with time constant tau.
 */
struct polynomial *FirstOrderFromTau(float tau, float fs)
{
	struct polynomial *pp = AllocatePolynomial(1);

	pp->coeff[0] = EpsilonFromTauFS(tau, fs) - 1.0;
	pp->coeff[1] = 1.0;
	return pp;
}

/* 
 *	FirstOrderFromCorner - Polynomial coefficient list for first-order 
 *	pole or zero with corner frequency fc.
 */
struct polynomial *FirstOrderFromCorner(float fc, float fs)
{
	float fct, rho;
	struct polynomial *pp = AllocatePolynomial(1);

	fct = fc / fs;
	rho = exp(-2.0*PI*fct);
	pp->coeff[0] = - rho;
	pp->coeff[1] = 1.0;
	return(pp);
}

/* 
 *	SecondOrderFromCenterQ - Polynomail coefficient list for second-order 
 *	complex poles or zeros
 */
struct polynomial *SecondOrderFromCenterQ(float NatFreq, float q, float fs)
{
	float cft, rho, theta;
	struct polynomial *pp = AllocatePolynomial(2);

	cft = NatFreq/fs;
	rho = exp(-PI * cft / q);
	theta = 2 * PI * cft * sqrt(1 - 0.25/q/q);
	pp->coeff[0] = rho*rho;
	pp->coeff[1] = -2.0 * rho * cos(theta);
	pp->coeff[2] = 1.0;
	return(pp);
}

/* 
 *	OuterMiddleEar - Create a filter that roughly models the effect of the
 *	outer and middle ears.  In this case it is just a simple high pass
 *	filter with a corner frequency given by EarPreemphCorner.
 */
struct filter *OuterMiddleEarFilter(float fs)
{
	struct filter *fp;

	fp = MakeFilter(FirstOrderFromCorner(EarPreemphCorner, fs),
		        NULL,
		        fs,
		        fs/4.0,
		        1.0);
	return(fp);
}

/*
 *	EarFrontFilter - Create a filter to handle the initial processing
 *	before the cascade of filters.  This filter has the following terms
 *	1)	A zero at DC (differentiator) to model the conversion of 
 *		acoustic pressure into basilar membrane motion.
 *	2)	A zero at the Nyquist rate to compensate for the narrow
 *		spacing of channels at the high frequencies.
 *	3)	The first pair of poles from the cascade of ear filters.
 */
struct filter *EarFrontFilter(float fs)
{
	struct filter *fp;
	struct polynomial *pp;

	pp = AllocatePolynomial(2);	/* Differentiator and Compensator */
	pp->coeff[0] = -1.0;
	pp->coeff[1] = 0.0;
	pp->coeff[2] = 1.0;

	fp = MakeFilter(pp,
			SecondOrderFromCenterQ(MaximumEarCF(fs),
					CascadePoleQ(MaximumEarCF(fs)),
					fs),
			fs,
			fs/4.0,
			1.0);
	return(fp);
}

/*
 *	EarStageFilter - OK, here it is....the definition of each stage of 
 *	the cascade-only filter bank.  Each stage is just a pair of poles
 *	and a pair of zeros.
 */
struct filter *EarStageFilter(float cf, float fs, float DCGain)
{
	struct filter *fp;

	fp = MakeFilter(SecondOrderFromCenterQ(CascadeZeroCF(cf),
					CascadeZeroQ(cf),
					fs),
			SecondOrderFromCenterQ(CascadePoleCF(cf),
					CascadePoleQ(cf),
					fs),
		        fs,
		        0.0,
		        DCGain);
	return(fp);
}

#ifdef	MAIN

main(argc, argv)
int	argc;
char	**argv;
{
	int	index;
	float	sampling_rate;
	float	cf;
	float	atof();

	if (argc < 3){
		printf("syntax: %s index sampling_rate\n",
			argv[0]);
		exit(1);
	}
	index = atoi(argv[1]);
	sampling_rate = atof(argv[2]);

	cf = EarChannelCF(index, sampling_rate);
	printf("The center frequency of the %d'th filter (%g sampling rate)",
		index, sampling_rate);
	printf(" is %g.\n", cf);
	printf("\tEarBandwidth is %g.\n", EarBandwidth(cf));
	printf("\tCascadeZeroCF is %g.\n", CascadeZeroCF(cf));
	printf("\tCascadeZeroQ is %g.\n", CascadeZeroQ(cf));
	printf("\tCascadePoleCF is %g.\n", CascadePoleCF(cf));
	printf("\tCascadePoleQ is %g.\n", CascadePoleQ(cf));

	printf("EpsilonFromTauFS(5.0/cf,%g) is %g.\n",sampling_rate,
		EpsilonFromTauFS(5.0/cf, sampling_rate));

	printf("FirstOrderFromTau(5.0/cf,%g) are ", sampling_rate);
	PrintPolynomial(FirstOrderFromTau(5.0/cf, sampling_rate));
	printf("\n");

	printf("FirstOrderFromCorner(.25*cf,%g) are ", sampling_rate);
	PrintPolynomial(FirstOrderFromCorner(.25*cf, sampling_rate));
	printf("\n");

	printf("SecondOrderFromCenterQ(.25*cf,2,%g) are ", sampling_rate);
	PrintPolynomial(SecondOrderFromCenterQ(.25*cf, 2.0, sampling_rate));
	printf("\n");

	printf("OuterMiddleEarFilter(%g) is: \n",sampling_rate);
	PrintFilter(OuterMiddleEarFilter(sampling_rate));

	printf("EarFrontFilter(%g) is: \n", sampling_rate);
	PrintFilter(EarFrontFilter(sampling_rate));

	printf("EarStageFilter(%g,%g,1.032525595) is: \n", cf, sampling_rate);
	PrintFilter(EarStageFilter(cf, sampling_rate, 1.032525595));
}

#endif	/* MAIN */
		

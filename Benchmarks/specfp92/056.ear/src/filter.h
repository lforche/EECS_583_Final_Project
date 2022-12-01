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
 *	A polynomial structure is used to store the coefficients to a 
 *	polynomial in the z variable.  A second degree polynomial will have
 *	the number 2 stored for the order and have an array of three (1,z,z^2)
 *	coefficients stored in the coeff array.
 */
struct polynomial {
	int	order;
	float	*coeff;
};

/*
 *	A filter is defined as the ratio of two polynomials.  In addition
 *	there is a scalar gain term.
 *
 *	The MakeFilter function allows the user to specify a target gain at
 *	any frequency.  The function MakeFilter multiplies the gain into all
 *	terms in the numerator.  Finally, the original sample_rate is kept 
 *	around to make it easier to evaluate the gain at any frequency.
 */
struct filter {
	struct polynomial *forward, *feedback;
	float	freq, gain;		/* Desired gain and frequency */
	float	sample_rate;		/* Sampling rate of filter */
};

float	FilterNumeratorCoeff(struct filter *fp, int i), FilterDenominatorCoeff(struct filter *fp, int i);
float	EarBandwidth(float cf), CascadeZeroCF(float cf), CascadeZeroQ(float cf), CascadePoleCF(float cf);
float	CascadePoleQ(float cf), MaximumEarCF(float fs), EarChannelCF(int index, float fs);
float	EpsilonFromTauFS(float tau, float fs);

struct polynomial *AllocatePolynomial(int order), *CoeffsFromTauFS();
struct polynomial *CoeffsFromFCFS(), *CoeffsFromCFQFS();
complex	PolyEval(struct polynomial *pp, complex x), RationalTransferFunction(), FilterEval(struct filter *fp, complex z), FilterGain(struct filter *fp, float freq);

struct filter *MakeFilter(struct polynomial *forward, struct polynomial *feedback, float fsamp, float freq, float gain), *OuterMiddleEarFilter(float fs);
struct filter *EarFrontFilter(float fs), *EarStageFilter(float cf, float fs, float DCGain);


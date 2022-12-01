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

static char     *RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/utilities.c,v 1.1 2002/10/05 19:42:58 ntclark Exp $";

#include	<stdio.h>
#ifdef	__STDC__
#include	<stdlib.h>
#endif	/* STDC */
#include	"complex.h"
#include	"filter.h"
#include	"earhdr.h"


char	*ArgumentTable[] = {
		"if",
		"of",
		"tau1",
		"tau2",
		"tau3",
		"tau4",
		"target1",
		"target2",
		"target3",
		"target4",
		"taufactor",
		"df",
		"breakf",
		"earq",
		"stepfactor",
		"sharpness",
		"offset",
		"preemph",
		"ff",
		"cf",
		"cstep",
		"clag",
		"cpus",
		"normalize",
		"umax",
		"maxsamples",
		0
	};

ProcessOption(char *p)
{
	int	Flag, cc;

	if (*p == '+')
		Flag = 1;
	else
		Flag = 0;

	while(cc= *++p)switch(cc){
	case 'D':
	case 'd':
		if (Flag)
			Debug ++;
		else
			Debug = 0;
		break;
	case 'p':
		printflag = Flag;
		break;
	case 'i':
		ImpulseInput = Flag;
		break;
	case 'a':
		UseAgc = Flag;
		break;
	case 'c':
		UseCascade = Flag;
		break;
	case 'm':
		UseDifference = Flag;
		break;
	case 'r':
		CalculateResponse = Flag;
		if (Flag){
			UseAgc = UseDifference = 0;
			ImpulseInput = 1;
		}
		break;
	case 'u':
		UseUltra = Flag;
		if (Flag)
			DecimationFactor = 1;
		break;
	case 'v':
		VideoRecord = Flag;
		break;
	default:
		fprintf(stderr,"bad flag: %c\n",cc);
		exit(1);
	}
}

ProcessArgument(char *p)
{
#ifndef	unix
	float	atof();
#endif	/* unix */
	
	switch(comm(p,ArgumentTable)){
	case 1:			/* if - input file for speech */
		ifn = p+3;
		break;
	case 2:			/* of - output file for cochlea data */
		ofn = p+3;
		if (!*ofn)
			ofn = 0;
		break;
	case 3:			/* tau1 - first agc time constant */
		AgcStage1Tau = atof(p+5);
		break;
	case 4:			/* tau2 - second agc time constant */
		AgcStage2Tau = atof(p+5);
		break;
	case 5:			/* tau3 - third agc time constant */
		AgcStage3Tau = atof(p+5);
		break;
	case 6:			/* tau4 - fourth agc time constant */
		AgcStage4Tau = atof(p+5);
		break;
	case 7: 		/* target1 - first Agc Target */
		AgcStage1Target = atof(p+8);
		break;
	case 8: 		/* target2 - second Agc Target */
		AgcStage2Target = atof(p+8);
		break;
	case 9: 		/* target3 - third Agc Target */
		AgcStage3Target = atof(p+8);
		break;
	case 10: 		/* target4 - fourth Agc Target */
		AgcStage4Target = atof(p+8);
		break;
	case 11:		/* taufactor */
		TauFactor = atof(p+10);
		break;
	case 12:		/* df - Decimation Factor 1 */
		DecimationFactor = atoi(p+3);
		if (DecimationFactor < 0)
			DecimationFactor = 1;
		break;
	case 13:		/* breakf - Ear Break Frequency */
		EarBreakFreq = atof(p+7);
		break;
	case 14:		/* earq */
		EarQ = atof(p+5);
		break;
	case 15:		/* stepfactor */
		EarStepFactor = atof(p+11);
		break;
	case 16:		/* sharpness */
		EarSharpness = atof(p+10);
		break;
	case 17:		/* offset */
		EarZeroOffset = atof(p+7);
		break;
	case 18:		/* preemph */
		EarPreemphCorner = atof(p+8);
		break;
	case 19:		/* fn - Filtered File Name */
		ffn = p+3;
		if (*ffn){
			ComputeFiltered = 1;
		} else {
			ffn = 0;
		}
		break;
	case 20:		/* cn - Correlation File Name */
		cfn = p+3;
		if (!*cfn)
			cfn = 0;
		break;
	case 21:		/* cstep - Steps between correlations */
		CorrelationStep = atoi(p+6);
		break;
	case 22:		/* clag - Total lags in correlations */
		CorrelationLags = atoi(p+5);
		break;
	case 23:		/* cpus - Number of CPUs to use */
		CPUs = atoi(p+5);
		break;
	case 24:		/* Normalize - For Correlation */
		Normalization = atof(p+10);
		break;
	case 25:		/* umax - Ultra Headroom factor */
		UltraHeadroom = atof(p+5);
		break;
	case 26:		/* maxsamples - limit the number of samples */
		MaxSamples = atoi(p+11);
		break;
	}
}

PrintStats(void) {
	printf("Lyon Ear Model\n");
	printf("\tInput File (if)..................... %s\n", 
		ImpulseInput? "An Impulse" : ifn);
	printf("\tOutput File (of).................... %s\n", ofn?ofn:"None");
	printf("\tFiltered Sound File (ff)............ %s\n", ffn?ffn:"None");
	printf("\tCorrelation Output File (cf)........ %s\n", cfn?cfn:"None");
	if (UseAgc){
	 printf("\tAgc Stage 1 Tau (tau1).............. %gs\n", AgcStage1Tau);
	 printf("\tAgc Stage 2 Tau (tau2).............. %gs\n", AgcStage2Tau);
	 printf("\tAgc Stage 3 Tau (tau3).............. %gs\n", AgcStage3Tau);
	 printf("\tAgc Stage 4 Tau (tau4).............. %gs\n", AgcStage4Tau);
	 printf("\tAgc State 1 Target (target1)........ %g\n", AgcStage1Target);
	 printf("\tAgc State 2 Target (target2)........ %g\n", AgcStage2Target);
	 printf("\tAgc State 3 Target (target3)........ %g\n", AgcStage3Target);
	 printf("\tAgc State 4 Target (target4)........ %g\n", AgcStage4Target);
	}
	printf("\tDecimation Tau Factor (taufactor)... %g\n", TauFactor);
	printf("\tDecimation Factor (df).............. %d\n", DecimationFactor);
	printf("\tEar Break Frequency (breakf)........ %g\n", EarBreakFreq);
	printf("\tEar Q Factor (earq)................. %g\n", EarQ);
	printf("\tEar Step Factor (stepfactor)........ %g\n", EarStepFactor);
	printf("\tEar Zero Sharpness (sharpness)...... %g\n", EarSharpness);
	printf("\tEar Zero Offset (offset)............ %g\n", EarZeroOffset);
	printf("\tEar Preemphasis Corner (preemph).... %g\n", EarPreemphCorner);
	if (UseUltra || cfn){
		printf("\tCorrelation Time Step (cstep)....... %d samples\n", 
			CorrelationStep);
		printf("\tCorrelation Lags (clag)............. %d samples\n", 
			CorrelationLags);
		printf("\tCorrelation Normalize (normalize)... %g\n", 
			Normalization);
		printf("\tUltra Headroom factor (umax)........ %g\n", 
			UltraHeadroom);
	}
	if (MaxSamples > 0)
		printf("\tNumber of samples (maxsamples)...... %ld\n",
			MaxSamples);
	if (!UseAgc)
		printf("\tNo AGC (-a)\n");
	if (!UseCascade)
		printf("\tNo cascade (independent channels) (-c)\n");
	if (!UseDifference)
		printf("\tNo difference of channels (-m)\n");
	if (CalculateResponse)
		printf("\tJust calculate response (+r)\n");
	if (UseUltra)
		printf("\tAnimate correlagram on Ultra (+u)\n");
	if (UseUltra && VideoRecord)
		printf("\tRecording video onto VTR (+v)\n");
	if (Debug)
		printf("\tDebug Mode\n");
	fflush(stdout);
}

syntax(void) {}

ChangeAgcParams(void)
{
	AgcEpsilon1 = EpsilonFromTauFS(AgcStage1Tau, sample_rate);
	AgcEpsilon2 = EpsilonFromTauFS(AgcStage2Tau, sample_rate);
	AgcEpsilon3 = EpsilonFromTauFS(AgcStage3Tau, sample_rate);
	AgcEpsilon4 = EpsilonFromTauFS(AgcStage4Tau, sample_rate);
}


ChangeDecimationParameters(void) {
	DecimationEpsilon = EpsilonFromTauFS(
		((DecimationFactor<1) ? 1 : DecimationFactor) * 
			TauFactor / sample_rate,
		sample_rate);
}

#define	min(a,b) (((a) > (b)) ? (b) : (a))
#define	max(a,b) (((a) < (b)) ? (b) : (a))

/*
 *	DesignEarFilters - This routine designs all of the filters needed for
 *	the ear model.  Most of the real work is done in the file eardesign.c.
 *	Mostly this routine is responsible for calling the filter design 
 *	functions and filling in the arrays that the actual ear model code
 *	needs to function.
 *
 *	The first stage is the ear filter bank models the outer and middle 
 *	ears and is a simple high pass filter.  The second stage has a zero
 *	at DC to model the conversion of acoustic pressure into basilar
 *	membrane motion, a zero at the Nyquist rate to compensate for the
 *	narrow spacing of channels and finally the first pair of poles from
 *	the cascade of ear filters.
 */

DesignEarFilters(void) {
	int	i;
	float	cf, prevcf, StageDcGain;
	struct filter *fp;

	fp = OuterMiddleEarFilter(sample_rate);
	a2[0] = FilterNumeratorCoeff(fp,0);
	a1[0] = FilterNumeratorCoeff(fp,1);
	a0[0] = FilterNumeratorCoeff(fp,2);
	b2[0] = 0.0;
	b1[0] = 0.0;

	fp = EarFrontFilter(sample_rate);
	a2[1] = FilterNumeratorCoeff(fp,0);
	a1[1] = FilterNumeratorCoeff(fp,1);
	a0[1] = FilterNumeratorCoeff(fp,2);
	b2[1] = FilterDenominatorCoeff(fp,0);
	b1[1] = FilterDenominatorCoeff(fp,1);

	for (i=2;i<MaxN;i++){
		prevcf = EarChannelCF(i-2, sample_rate);
		cf = EarChannelCF(i, sample_rate);
		StageDcGain = prevcf / cf;
		if ( CascadePoleQ(cf) < 0.5){
			EarLength = min(i,EarLength);
			a0[i] = a1[i] = a2[i] = 0.0;
			b1[i] = b2[i] = 0.0;
		} else {
			fp = EarStageFilter(cf, sample_rate, StageDcGain);
			a2[i] = FilterNumeratorCoeff(fp,0);
			a1[i] = FilterNumeratorCoeff(fp,1);
			a0[i] = FilterNumeratorCoeff(fp,2);
			b2[i] = FilterDenominatorCoeff(fp,0);
			b1[i] = FilterDenominatorCoeff(fp,1);
		}
	}
/*
	EarLength = max(EarLength, EAR_LENGTH);
 */

	if (Debug) {
		FILE *fp;
		fp = fopen("coeffs.list","w");
		if (!fp){
		    fprintf(stderr,
		    "ear: Couldn't open coeffs.list for coefficient list.\n");
		    return;
		}
		for (i=0;i<EarLength;i++){
			fprintf(fp,"((%g %g %g)\n", a2[i], a1[i], a0[i]);
			fprintf(fp," (%g %g %g))\n", b2[i], b1[i], 1.0);
		}
		fclose(fp);
	}
}

struct CommonStruct {
	int	n;
	int	UseAgc, UseDifference, UseCascade, ComputeFiltered;
	int	DecimationFactor;
	float	DecimationEpsilon;
	float	AgcEpsilon1, AgcEpsilon2;
	float	AgcEpsilon3, AgcEpsilon4;
	float	AgcStage1Target, AgcStage2Target;
	float	AgcStage3Target, AgcStage4Target;
	float	a0[MaxN], a1[MaxN], a2[MaxN], b1[MaxN], b2[MaxN];
	};

#define	InitCommon(x)	CBlock->x = x;

INITCOM(struct CommonStruct *CBlock)
{
	register int i;

	CBlock->n = EarLength;
	InitCommon( UseAgc );
	InitCommon( UseDifference );
	InitCommon( UseCascade );
	InitCommon( ComputeFiltered );
	InitCommon( DecimationFactor );
	InitCommon( DecimationEpsilon );
	InitCommon( AgcEpsilon1 );
	InitCommon( AgcEpsilon2 );
	InitCommon( AgcEpsilon3 );
	InitCommon( AgcEpsilon4 );
	InitCommon( AgcStage1Target );
	InitCommon( AgcStage2Target );
	InitCommon( AgcStage3Target );
	InitCommon( AgcStage4Target );

	for (i=0;i<MaxN;i++){
		InitCommon( a0[i] );
		InitCommon( a1[i] );
		InitCommon( a2[i] );
		InitCommon( b1[i] );
		InitCommon( b2[i] );
	}
}


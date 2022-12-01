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

static char     *RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/earfilters.c,v 1.1 2002/10/05 19:42:58 ntclark Exp $";

/*
 *	The routines in this file implement the ear model.  A single input
 *	sample is passed to EARSTEP and the processing for all channels of the
 *	the cochlea model are performed.  EARSTEP is written in both C and
 *	Fortran; this explains the un-C-like calling sequence.
 */

#include	<stdio.h>
#include	<math.h>
#include	"earhdr.h"

void agc(float *input, float *state, float *output, float epsilon, float target, int n);
void fos(float *input, float *state, float *output, float gain, int n);

float Sos1State[MaxN], Sos2State[MaxN];
float Agc1State[MaxN+2], Agc2State[MaxN+2], Agc3State[MaxN+2],
	Agc4State[MaxN+2];
float InputState[MaxN], DecimateState1[MaxN], DecimateState2[MaxN];


EARSTEP(float *input, float *output)
{
	register int i;
	extern	FILE	*ffp;
	extern int	EarLength;
	extern float	AgcEpsilon1, AgcEpsilon2, AgcEpsilon3, AgcEpsilon4;
	extern float	AgcStage1Target, AgcStage2Target;
	extern float	AgcStage3Target, AgcStage4Target;
	extern float	DecimationEpsilon;
	extern float	a0[], a1[], a2[], b1[], b2[];
	extern int	UseAgc, UseDifference, UseCascade, ComputeFiltered;
	extern int	DecimationFactor;

	if (UseCascade){
		for (i= EarLength-1; i>0 ; i--)		/* Don't do preemph 
							 * channel
							 */
			InputState[i] = InputState[i-1];
		InputState[0] = *input;			/* Now fill in the 
							 * preemph
							 */
	} else {
		for (i=0;i<EarLength;i++){		/* Copy input to all 
							 * channels
							 */
			InputState[i] = *input;
		}
	}

	sos(InputState, Sos1State, Sos2State, a0, a1, a2, b1, b2, 
		InputState, EarLength);

	if (UseAgc){
		hwr(InputState, output, EarLength);
		agc(output, Agc1State, output, AgcEpsilon1, 
				AgcStage1Target, EarLength);
		agc(output, Agc2State, output, AgcEpsilon2, 
				AgcStage2Target, EarLength);
		agc(output, Agc3State, output, AgcEpsilon3, 
				AgcStage3Target, EarLength);
		agc(output, Agc4State, output, AgcEpsilon4, 
				AgcStage4Target, EarLength);
	} else {
		for (i=0;i<EarLength;i++)
			output[i] = InputState[i];
	}
	if (ComputeFiltered){
		float	Output[MaxN+1];
		if (UseAgc){
			for (i=0;i< EarLength;i++){
				Output[i] = InputState[i] * 
						fabs(1.0 - Agc1State[i+1]) *
						fabs(1.0 - Agc2State[i+1]) *
						fabs(1.0 - Agc3State[i+1]) *
						fabs(1.0 - Agc4State[i+1]);
			}
			fwrite(Output, EarLength, sizeof(Output[0]), ffp);
		} else {
			fwrite(InputState, EarLength, sizeof(InputState[0]), ffp);
		}
	}
	if (UseDifference){
		difference(output, output, EarLength);
		hwr(output, output, EarLength);
	}
	
	if (DecimationFactor > 0) {
		fos(output, DecimateState1, output, DecimationEpsilon, EarLength);
		fos(output, DecimateState2, output, DecimationEpsilon, EarLength);
	}
}

	

/* SOS - Calculate a bunch of second order sections.
 *	y(n) = a0*x(n) + a1*x(n-1) + a2*x(n-2) - b1*y(n-1) - b2*y(n-2)
 *
 *	Both input and output can be the same vector of numbers.
 */
sos(float *input, float *state1, float *state2, float *a0, float *a1, float *a2, float *b1, float *b2, float *output, int n)
{
	register int i;
	register float tempin;

#include	"ivdep.h"
	for (i=0;i<n;i++){
		tempin = input[i];
		output[i] = a0[i] * tempin                     + state1[i];
		state1[i] = a1[i] * tempin - b1[i] * output[i] + state2[i];
		state2[i] = a2[i] * tempin - b2[i] * output[i];
	}
}


void
agc(float *input, float *state, float *output, float epsilon, float target, int n)
{
        register int i;
        float   temp[MaxN+2];
        float   OneMinusEpsOverThree = (1.0 - epsilon)/3.0;
        float   EpsOverTarget = epsilon/target;
        state[0] = state[1];                    /* Take care of end effec
ts */
        state[n+1] = state[n];                  /* Take care of end effec */

#include        "ivdep.h"

        for (i=0;i<n;i++){
                output[i] = fabs((1.0 - state[i+1]) * input[i]);
                temp[i+1] = output[i] * EpsOverTarget +
                              OneMinusEpsOverThree *
                              (state[i]+state[i+1]+state[i+2]);
        }

#include        "ivdep.h"

        for (i=1;i<n+1;i++){
                register float f;
                f = temp[i];
                if (f > 1.0)
                        f = 1.0;
                state[i] = f;
        }
}


hwr(float *input, float *output, int n)
{
	register int i;
	register float temp;

#include	"ivdep.h"
	for (i=0;i<n;i++){
		temp = input[i];
		if (temp < 0.0)
			output[i] = 0.0;
		else
			output[i] = temp;
	}
}

difference(float *input, float *output, int n)
{
	register int i;
	static int	initialized = 0;
	static float old_input[MaxN];
	float	temp;

	if (!initialized)
		for (i=0;i<MaxN; i++)
			old_input[i] = 0.0;
	initialized = 1;

	for (i=n-1;i>0;i--){
		temp = input[i];
		output[i] = input[i-1] - temp;
		old_input[i] = temp;
	}
	old_input[0] = input[0];
	output[0] = output[1];
}

void
fos(float *input, float *state, float *output, float gain, int n)
{
	register int i;
	register float OneMinusGain = 1.0 - gain;

#include	"ivdep.h"
	for (i=0;i<n;i++)
		state[i] = output[i] = gain*input[i] + OneMinusGain*state[i];
}

#ifdef	MAIN

float AgcEpsilon1, AgcEpsilon2, AgcEpsilon3, AgcEpsilon4;
float AgcStage1Target, AgcStage2Target, AgcStage3Target, AgcStage4Target;
float DecimationEpsilon;

float	a0[MaxN], a1[MaxN], a2[MaxN], b1[MaxN], b2[MaxN];
float	input[MaxN], state1[MaxN], state2[MaxN];

#define	LENGTH		500
#define	CHANNELS	100

float	Output[CHANNELS];
int	UseAgc = 0; CalculateResponse = 0;

main(){
	register int i, j;
	float	period;
	
	for (period = 10.0, i=0; i < CHANNELS; i++, period++){
		a0[i] = 1.0;
		a1[i] = 0.0;
		a2[i] = 0.0;
		b1[i] = -2.0 * cos(2.0*PI/period);
		b2[i] = 1.0;
		state1[i] = state2[i] = 0.0;
	}

	for (i=0;i<LENGTH;i++){
		if (i == 0)
			for (j=0; j<CHANNELS; j++)
				input[j] = 1.0;
		else
			for (j=0; j<CHANNELS; j++)
				input[j] = 0.0;
		sos(input, state1, state2, a0, a1, a2, b1, b2, 
			Output, CHANNELS);
		for (j=0;j<CHANNELS;j++)
			printf("%g\n", Output[j]);
		printf("\n");
	}
		
	
#ifdef	BAG_THIS
	hwr(Impulse,Impulse,500);
	for (i=0;i<500;i++)
		printf("%g\n", Impulse[i]);
	for (i=0;i<MaxN;i++)
		Impulse[i] = 10.00;
	state1[1] = 0.0;
	for (i=0;i<MaxN;i++)
		agc(&Impulse[i],state1,&Output[i], -1.0, -1.7, .1, 1);

	for (i=0;i<500;i++)
		printf("%g\n", Output[i]);
#endif	/* BAG_THIS */
}

#endif	/* MAIN */

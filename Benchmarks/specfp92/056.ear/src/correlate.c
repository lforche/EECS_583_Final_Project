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

static char     *RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/correlate.c,v 1.2 2009/02/18 03:23:38 mehrara Exp $";

/*
 *	This file calculates correlations of the signals produced by each 
 *	channel of the cochlea.  The output from these routines is called
 *	a correlagram.
 *
 *	Correlagrams are computed by passing the output of the cochlear model
 *	to this module every sample time.  The vector (of length 
 *	CorrelationChannels) of values is stored in an array for later 
 *	computation.  Periodically the routine EarCorrelation should be called
 *	to compute the autocorrelation of each channel and return an array
 *	of autocorrelations.
 *
 *	There are three types of routines in this file.  They are 
 *		Initialization
 *		Data Transmission
 *		Calculations
 *	The routine InitCorrelation must be called first so that space can
 *	be allocated to save the incoming data to be correlated.  A routine
 *	called SendInputToCorrelation is called for every sample output from
 *	the cochlear model to save the data for later correlation.  Finally
 *	several routines are provided to calculate the correlation.  The 
 *	different routines use algorithms with varying degrees of robustness
 *	and speed.
 */

#include        <stdlib.h>
#include	<stdio.h>
#include	<math.h>
#include	"earhdr.h"


static float	*CorrelationData = NULL;		/* Actual storage for 
							 * the correlation 
							 * input data.  Length
							 * x Channels
							 */
static int	CorrelationChannels = 0;		/* Number of Channels */
static int32	CorrelationIndex = 0;			/* Current index into 
							 * data */
static int	CorrelationDataLength = 0;		/* Length of input data
							 */
static int32	CorrelationDataCount = 0;		/* How much data has 
							 * been processed.
							 */
static int	CorrelationFFTLength = 0;		/* Length of FFT's */
static int	CorrelationLogLength = 0;		/* Log of FFT Length */

							/* How to access data 
							 * in the input data 
							 * array 
							 */
#define	CorrelationDataArray(Channel, Index) \
	(CorrelationData[(int32)(Channel)*CorrelationDataLength + \
	((int32)(CorrelationIndex + (Index))%CorrelationDataLength)])
	
							/* How to access data in
							 * the output data array
							 */
#define	OutputDataArray(Channel, Lag) \
	(Output[(int32)(Channel)*Lags + (Lag)])

static float	*Real, *Im;				/* Pointer to FFT 
							 * Storage
							 */

/*
 *	InitCorrelation - This routine should be called once to define the
 *	number of channels in the cochlear model and to set the number of 
 *	samples that should be saved.  The resolution of the correlagram
 *	is determined by the number of samples saved.
 */
InitCorrelation(int Channels, int Length)
{
	extern	char	*progname;
	extern	int	UseUltra;
	
	CorrelationChannels = Channels;
	CorrelationDataLength = Length;
	CorrelationIndex = 0;

							/* Some parameters 
							 * needed for the FFT 
							 * based correlation.
							 */
	for (CorrelationLogLength = 0; (1<<CorrelationLogLength) < Length; 
		CorrelationLogLength++);
	CorrelationLogLength ++;			/* Twice as long to 
							 * prevent circular 
							 * convolutions 
							 */
	CorrelationFFTLength = 1 << CorrelationLogLength;
	
#ifdef	DEBUG
	printf("Channels is %d, Length is %d, CorrelationFFTLength is %d, \n",
		Channels, Length, CorrelationFFTLength);
	printf("CorrelationDataLength is %d.\n", CorrelationDataLength);
#endif	/* DEBUG */
							/* Allocate an Extra 
							 * channel's worth of 
							 * storage so that
							 * correlations two at 
							 * a time (with FFT)
							 * work ok.
							 */
	CorrelationData = (float *)calloc((CorrelationChannels+1L)*
					  CorrelationDataLength, 
					  sizeof(*CorrelationData));
	if (!CorrelationData){
		fprintf(stderr, 
			"%s: Can't allocate %d bytes for correlation data.\n",
			progname, (Channels+1L)*Length*sizeof(*CorrelationData));
		exit(1);
	}
	Real = (float *)calloc(CorrelationFFTLength+1L,sizeof(*Real));
	Im = (float *)calloc(CorrelationFFTLength+1L,sizeof(*Im));
	if (!Real || !Im){
		fprintf(stderr, 
			"%s: Can't allocate %ld bytes for correlation FFTs.\n",
			progname, (CorrelationFFTLength+1L)*2*
					sizeof(*CorrelationData));
		exit(1);
	}
#ifndef LLVM //mehrara 2/2009. Empty functions breaks out passes in LLVM
#ifndef	PLOT3D
	if (UseUltra){
		InitDisplay();
							/* Set both frame 
							 * buffers to blue.
							 */
		SetDisplayValue(80 + 80*256 + 255*256*256);
		UpdateDisplay(CorrelationData,0,0,0.0,1.0);
		SetDisplayValue(80 + 80*256 + 255*256*256);
		UpdateDisplay(CorrelationData,0,0,0.0,1.0);
	}
#endif	/* PLOT3D */
#endif
}

#ifdef	DEBUG
/*
 *	CheckCorrelation - This routine is used to verify that the output 
 *	of the correlation routines is normalized as it should be.  This is
 *	used only for debugging.
 */
CheckCorrelation(where)
char	*where;
{
	register int32 i, Count;

	Count = CorrelationChannels*CorrelationDataLength;
	for (i=0;i<Count;i++) {
		if (CorrelationData[i] > 1.0 || CorrelationData[i] < -1.0){
			printf("%s: Got bad correlation data at %d (%g).\n",
				where, i, CorrelationData[i]);
			exit(0);
		}
	}
}
#endif	/* DEBUG */

/*
 *	SendInputToCorrelation - This routine is called to pass an array of
 *	data from the cochlear model to the correlation routines.  The input
 *	array represents the firing rate of each channel of the cochlear model.
 *	The routine InitCorrelation should be called first to set the 
 *	parameters of the ear model.
 */
SendInputToCorrelation(float *Data)
{
	register int	Channel;
	register float	f;
	int	i, One = 1;

#include	"ivdep.h"
	for (Channel=0;Channel<CorrelationChannels; Channel++){
		f = Data[Channel];			/* Optional Scalar 
							 * Function goes here 
							 */
		CorrelationDataArray(Channel, 0) = f;
	}

	CorrelationIndex = (CorrelationIndex + 1) % CorrelationDataLength;
	CorrelationDataCount++;
	if (CorrelationDataCount > CorrelationDataLength)
		CorrelationDataCount = CorrelationDataLength;
}


/*
 *	MakeHamming - This routine makes a hamming window of any desired 
 *	length.  This routine maintains a cache to remember the last Hamming
 *	window created.  If the requested size is td.  Otherwise it deallocates the 
 *	old Hamming window and creates a new one.
 */
static float	*HammingWindow = NULL;
static int	HammingLength = 0;

float *
MakeHamming(int Length)
{
	int	i;

	if (!HammingWindow || Length != HammingLength){
		if (HammingWindow)
			free(HammingWindow);
		HammingWindow = (float *)malloc((int32)Length*sizeof(*HammingWindow));
		if (!HammingWindow){
			fprintf(stderr,"%s: Can't allocate space for %d hamming window.\n",
				progname, Length);
			exit(1);
		}
		HammingLength = Length;
		printf("Making a hamming window of length %d.\n", Length);
		for (i=0;i<Length;i++)
			HammingWindow[i] = .54 + .46 * cos(PI*(i-Length/2.0)/
								(Length/2.0));
	}
	return(HammingWindow);
}

static float	*CompensatorWindow = NULL;
static float	CompensatorLength = 0;

float *
MakeCompensator(int Length)
{
	register int	i, lag;
	float	*Hamming = MakeHamming(Length), sum;

	if (!CompensatorWindow || Length != CompensatorLength){
		if (CompensatorWindow)
			free(CompensatorWindow);
		CompensatorWindow = (float *)malloc(Length*
					sizeof(*CompensatorWindow));
		if (!CompensatorWindow){
			fprintf(stderr,"%s: Can't allocate space for %d Compensator window.\n",
				progname, Length);
			exit(1);
		}
		CompensatorLength = Length;
		printf("Making a Compensator window of length %d.\n", Length);
		for (lag = 0;lag<Length;lag++){
			sum = 0.0;
			for (i=0;i+lag<Length;i++){
				sum += Hamming[i]*Hamming[i+lag];
			}
			CompensatorWindow[i] = sum / CompensatorWindow[0];
		}
	}
	picout("Compensator",CompensatorWindow,Length*8);
	exit(1);
	return(CompensatorWindow);
}

/*
 *	SimpleCorrelation - This routine calculates the autocorrelation of
 *	each ear channel by brute force.  The resulting "Lags" outputs for
 *	each channel are placed into the Output array.
 */
float
SimpleCorrelation(float *Output, int Lags)
{
	int	i, Channel, Lag;
	float	Sum, Max=0, Scaling;
	float	*Hamming = MakeHamming(CorrelationDataLength);
	
	for (Channel = 0; Channel < CorrelationChannels; Channel++){
		SystemCursor();
		for (Lag = 0; Lag < Lags; Lag++){
			Sum = 0.0;
			for (i = Lag; i < CorrelationDataLength; i++){
				Sum += CorrelationDataArray(Channel, i) *
					CorrelationDataArray(Channel, i - Lag);
			}
			if (Lag == 0) { 
				if (Sum == 0.0)
					Scaling = 1.0;
				else
					Scaling = 1/pow(Sum,Normalization);
			}
			OutputDataArray(Channel, Lag) = Sum * Scaling; 
		}
	} 

	Max = CorrelationLags * AgcStage4Target * AgcStage4Target * .125;
	Max = Max / pow(Max,Normalization);

	return(Max);
}

/*
 *	FFTCorrelation - Use FFT to compute autocorrelation.
 *	To save time use the symettry of the real FFT and do two FFT's at once.
 *	Stick the first data in the real part and the second data in the 
 *	imaginary part of the input.  Remember for real valued inputs the 
 *	output of the FFT will have even reals and odd imaginary components.  
 *	To get the output values do
 *		Real of first	even of real
 *		Im of first	odd of im
 *		
 *		Real of second	even of imaginary
 *		Im of second	odd of real
 *
 *	This routine is the preferred way to calculate the autocorrelation
 *	on all machines except for the Cray.
 */
float 
FFTCorrelation(float *Output, int Lags)
{
	int	Channel, i, j;
	float	max = 0, FirstScale, SecondScale;
	float	FirstReal, FirstIm, SecondReal,SecondIm, FirstMag, SecondMag;
	float	*Hamming = MakeHamming(CorrelationDataLength);
	
	if (Lags >= CorrelationFFTLength/2){
		fprintf(stderr, 
		    "%s: Number of Lags (%d) is greater than data size (%d)\n",
			progname, Lags, CorrelationFFTLength/2);
		exit(1);
	}
	
	for (Channel=0;Channel < CorrelationChannels; Channel += 2){
		SystemCursor();
							/* Fill the data into 
							 * the real and 
							 * imaginary parts
							 * of the FFT array 
							 */
		for (i=0; i<CorrelationDataLength; i++){
			Real[i] = CorrelationDataArray(Channel, i) * Hamming[i];
			Im[i] = CorrelationDataArray(Channel+1, i) * Hamming[i];
			Real[CorrelationFFTLength-i] = 0.0;
			Im[CorrelationFFTLength-i] = 0.0;
		}
							/* Zero pad the rest of
							 * the array.
							 */
		for (i=CorrelationDataLength;i<=CorrelationFFTLength/2;i++){
			Real[i] = Im[i] = 0.0;
			Real[CorrelationFFTLength-i] = 0.0;
			Im[CorrelationFFTLength-i] = 0.0;
		}
		
							/* Now do the FFT */
		SystemCursor();
		/* Removed for SPEC
		starttimer(1);
		*/
		fft(Real, Im, CorrelationLogLength, 0);
		/* Removed for SPEC
		endtimer(1);
		*/
		SystemCursor();

							/* Fill in an extra 
							 * point at the end so 
							 * when we use symettry
							 * to split the FFT 
							 * output into two
							 * we don't have to 
							 * deal with the [0] 
							 * case specially
							 */
		/* Removed for SPEC
		starttimer(2);
		*/
		Real[CorrelationFFTLength] = Real[0];
		Im[CorrelationFFTLength] = Im[0];

#include	"ivdep.h"
		for (i=0;i<=CorrelationFFTLength/2;i++){
			j = CorrelationFFTLength - i;
			FirstReal =  (Real[i] + Real[j]) /2.0;
			FirstIm =    (Im[i]   - Im[j])   /2.0;
			SecondReal = (Im[i]   + Im[j])   /2.0;
			SecondIm =   (Real[i] - Real[j]) /2.0;
		
			FirstMag = FirstReal*FirstReal + FirstIm*FirstIm;
			SecondMag = SecondReal*SecondReal + SecondIm*SecondIm;
			
			Real[i] = Real[j] = FirstMag;
			Im[i] = Im[j] = SecondMag;
		}
		/* Removed for SPEC
		endtimer(2);
		*/
		
		SystemCursor();
		/* Removed for SPEC
		starttimer(3);
		*/
		fft(Real, Im, CorrelationLogLength, 1);
		/* Removed for SPEC
		endtimer(3);
		*/
		SystemCursor();
	
							/* Hack Alert
							 * The following code
							 * tries to normalize
							 * the autocorrelations
							 * by the zero lag 
							 * term. Normally this 
							 * is ok but when the 
							 * input is all zeros 
							 * then after
							 * fft'ing you are left
							 * with random bit 
							 * noise.  This check
							 * tries only does the
							 * scaling if the zero
							 * lag is really bigger
							 * than the rest.
							 */

		/* Removed for SPEC
		starttimer(4);
		*/
		if (Real[0] <= 0.0e-10 || Real[0] < Real[1] || 
		    Real[0] < Real[2]){
			FirstScale = 0.0;
		} else {
			FirstScale = 1/pow(Real[0],Normalization);
		}  

		if (Im[0] <= 0.0e-10 || Im[0] < Im[1] || Im[0] < Im[2]){
			SecondScale = 0.0;
		} else {
			SecondScale = 1/pow(Im[0],Normalization);
		}

		for (i=0;i<Lags; i++){
			OutputDataArray(Channel, i)  = Real[i]*FirstScale;
			OutputDataArray(Channel+1, i)  = Im[i]*SecondScale;
		}
		/* Removed for SPEC
		endtimer(4);
		*/
	}

	max = CorrelationLags * AgcStage4Target * AgcStage4Target * .125;
	max = max / pow(max,Normalization);

	return(max);
}

/*
 *	HartleyCorrelation - This is the prototype of a routine that will
 *	eventually use the Hartley transform to do the correlation.  The 
 *	Bracewell/Hartley transform has all the nice properties of the FFT
 *	but it is real valued so we don't have to do the 2-in-one hack that
 *	was used to make the FFTCorrelation run fast.
 */
float
HartleyCorrelation(float *Output, int Lags)
{
	int	i, Channel, Lag;
	float	Sum, Max=0, Scaling, FirstReal, FirstIm;
	float	*Hamming = MakeHamming(CorrelationDataLength);
	
	for (Channel = 0; Channel < CorrelationChannels; Channel++){
							/* Fill the data into 
							 * the real part
							 * of the FFT array 
							 */
		for (i=0; i<CorrelationDataLength; i++){
			Real[i] = CorrelationDataArray(Channel, i) * Hamming[i];
			Real[CorrelationFFTLength-i] = 0.0;
			Im[i] = Im[CorrelationFFTLength-i] = 0.0;
		}
							/* Zero pad the rest of
							 * the array.
							 */
		for (i=CorrelationDataLength;i<=CorrelationFFTLength/2;i++){
			Real[i] = Im[i] = 0.0;
			Real[CorrelationFFTLength-i] = 0.0;
			Im[CorrelationFFTLength-i] = 0.0;
		}
		
							/* Now do the FFT */
		/* Removed for SPEC
		starttimer(11);
		*/
		fft(Real, Im, CorrelationLogLength, 0);
		/* Removed for SPEC
		endtimer(11);
		*/

		/* Removed for SPEC
		starttimer(12);
		*/
		Real[CorrelationFFTLength] = Real[0];
		Im[CorrelationFFTLength] = Im[0];

#include	"ivdep.h"
		for (i=0;i<CorrelationFFTLength;i++){
			FirstReal =  Real[i];
			FirstIm =    Im[i];
			Real[i] = FirstReal*FirstReal + FirstIm*FirstIm;
			Im[i] = 0;
		}
		/* Removed for SPEC
		endtimer(12);
		*/
		
		/* Removed for SPEC
		starttimer(13);
		*/
		fft(Real, Im, CorrelationLogLength, 1);
		/* Removed for SPEC
		endtimer(13);
		*/

		if (Real[0] <= 0.0 || Real[0] < Real[1] || Real[0] < Real[2]){
			Scaling = 0.0;
		} else {
			Scaling = 1/pow(Real[0],Normalization);
		}  
		for (i=0;i<Lags; i++){
			OutputDataArray(Channel, i) = Real[i]*Scaling;
		}
	}
	Max = CorrelationLags * AgcStage4Target * AgcStage4Target * .125;
	Max = Max / pow(Max,Normalization);

	return(Max);
}


/*
 *	EarCorrelation - This routine is actually called from the main program
 *	to do the correlations.  It just starts up a timer, calls the 
 *	appropriate correlation code and optionally displays the result on 
 *	the Ultra Buffer (if you are running on a Cray.)
 */
float
EarCorrelation(float *Output, int Lags)
{
	float	Max;
	extern	int	UseUltra;
	
	/* Removed for SPEC
	starttimer(0);
	*/
	
	Max = FFTCorrelation(Output, Lags);
	
	if (UseUltra){
		char	PlotBuffer[BUFSIZ];
		int	i, Lag, Channel;
		float	Min = 0.0;

		/* Removed for SPEC
		starttimer(7);
		*/

#ifdef	PLOT3D
#define	TmpFile	"/tmp/correlagram"
#define	PlotCommand "/v/malcolm/bin/plot3d z=/tmp/correlagram xsize=%d ysize=%d xskip=1 zmax=%g -P yp=5 scfac=.5 tl=\"%10.5f\" phi1=-40 | oultraplot -a"
		sprintf(PlotBuffer,PlotCommand,Lags,CorrelationChannels,
		    AgcStage4Target*sqrt(2.0*CorrelationLags)*10*UltraHeadroom,
		    SampleNumber/sample_rate);
	        Output[Lags*(CorrelationChannels-1)] = 
		    AgcStage4Target*sqrt(2.0*CorrelationLags)*10*UltraHeadroom;
		

		picout(TmpFile,Output,Lags*CorrelationChannels);
		printf("%s\n", PlotBuffer);
		i = system(PlotBuffer);
		if (i < 0){
		     fprintf(stderr,"System() failed.  Try setenv NCPUS=1\n");
		     exit(1);
		}
#else	/* !PLOT3D */
#ifndef LLVM
		UpdateDisplay(Output,Lags,CorrelationChannels,0.0, Max);
#endif  /* LLVM */
#endif	/* PLOT3D */
		/* Removed for SPEC
		endtimer(7);
		*/
		;
	} 
	/* Removed for SPEC 
	endtimer(0); 
	*/
	return(Max);
}

static	int	*index;
static	float	*warp, *frac, *frac1, *newd;
static	int	StretchStarted = 0;

StretchDisplay(float *data, int lags, int channels)
{
	register int i,j;
	
	if (!StretchStarted){
		index = (int *) malloc(sizeof(*index)*lags);
		warp = (float *) malloc(sizeof(*warp)*lags);
		frac = (float *) malloc(sizeof(*frac)*lags);
		frac1 = (float *) malloc(sizeof(*frac1)*lags);
		newd = (float *) malloc(sizeof(*newd)*lags);

		for (i=0;i<lags;i++){
			warp[i] = (lags-1)/pow((float)lags,2.718)*
					pow((float)i,2.718);
/*
			warp[i] = (lags-1)/log((float)lags)*log((float)i+1);
			warp[i] = i+1;
 */
			index[i] = floor(warp[i]);
			frac[i] = warp[i]-index[i];
			frac1[i] = 1-frac[i];
			picout("warp.d",warp,lags);
		}
		StretchStarted = 1;
	}

	for (j=0;j<channels;j++){
		float	*row;

		row = &data[j*lags];

#include	"ivdep.h"
		for (i=0;i<lags;i++)
			newd[i] = row[index[i+1]]*frac1[i+1] +
				  row[index[i+1]+1]*frac[i+1];
#include	"ivdep.h"
		for (i=0;i<lags;i++)
			row[i] = newd[i];
	}
}


		

#ifdef	MAIN

#define	NChannels	2
#define	NLength		32

char	*progname = "correlate test";

/*
 *	Main Program (Test Code) - This main program generates two channels
 *	of data and then calls FFTCorrelation to make sure the output is 
 *	correct.  One channel is a sine wave so the output should also be
 *	a sine wave.  The other channel has a square pulse so the output should
 *	be a triangle wave.
 */
int	UseUltra = 0;
main(){
	register int	i;
	float	Data[NChannels], *Output;

	InitCorrelation(NChannels, NLength);
	
	for (i=0;i<NLength; i++){
		Data[0] = sin(i*2*PI/7.0);
		Data[1] = (i < NLength/2)? 1.0 : 0.0;
		SendInputToCorrelation(Data);
	}
	
	Output = (float *)calloc(NLength*NChannels,sizeof(*Output));
	if (!Output){
		fprintf(stderr, 
		     "%s: Couldn't allocate %d bytes for output correlation.\n",
			progname, NLength*NChannels*sizeof(*Output));
		exit(1);
	}
	
	FFTCorrelation(Output, NLength/2);
	
	for (i=0;i<NLength; i++){
		printf("%4d:	%10g	%10g\n", i, Output[0*NLength/2 + i], 
						Output[1*NLength/2 + i]);
	}
}

#endif	/* MAIN */

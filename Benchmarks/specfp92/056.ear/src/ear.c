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

static char     *RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/ear.c,v 1.1 2002/10/05 19:42:58 ntclark Exp $";

/*
 *	This is the main program for calculating cochleagrams and correlagrams.
 *	This routine just does argument parsing and calls other routines to
 *	design the filters and perform the calculations.
 */

#include        <stdlib.h>
#include	<stdio.h>
#include	"complex.h"
#include	"filter.h"
#include	"earhdr.h"


main(int argc, char **argv)
{
	int32	i;
	float	*Data, *ReadInputFile(char *FileName, float *SamplingRate, long int *Length);
	/* Changed Output from float to static float */
	static float	Output[MaxN];
	FILE	*ofp;
	float	Max;
	float 	k;

	FILE *fp;


	progname = *argv;
	while(argv++ , --argc){
		if (**argv == '?')
			syntax();
		if(( **argv=='-' || **argv=='+')&& argv[0][1]) {
			ProcessOption(*argv);
		}else {
			ProcessArgument(*argv);
		}
	}
	
	if (ffn){
		ffp = fopen(ffn,"w");
		if (!ffp) {
			fprintf(stderr, 
			    "%s: Can't open %s for writing filtered data.\n",
				argv[0]);
			exit(1);
		}
	}

	if (printflag){
		PrintStats();
	}

	OpenOutputFile(ofn);

	if (ImpulseInput){
		DataLength = 512;
		Data = (float *)calloc(DataLength, sizeof(*Data));
		Data[0] = IMPULSE_HEIGHT;
	} else {
		Data = ReadInputFile(ifn, &sample_rate, &DataLength);
	}

	ChangeDecimationParameters();
	ChangeAgcParams();

	DesignEarFilters();

#ifdef	MINUSG
	CPUs = 1;
#endif	/* MINUSG */


	if (CalculateResponse){
		register int	j;
		float	*OutputArray;
		float	*Hamming;

		OutputArray = (float *)calloc(RESPONSE_LENGTH*EarLength,
						sizeof(float));
		if (!OutputArray){
			fprintf(stderr, 
			   "%s: Couldn't allocate %d floats for OutputArray.\n",
			   progname, 
			   RESPONSE_LENGTH*EarLength);
			exit(1);
		}

		Hamming = (float *)calloc(RESPONSE_LENGTH,sizeof(float));
		if (!Hamming){
			fprintf(stderr, 
			   "%s: Couldn't allocate %d bytes for Hamming.\n",
			   progname, 
			   RESPONSE_LENGTH);
			exit(1);
		}

		for (i=0;i<RESPONSE_LENGTH;i++)
			Hamming[i] = .54 + 
				.46*cos(2*PI*i/2.0/(float)RESPONSE_LENGTH);

		for (i=0;i<RESPONSE_LENGTH;i++){
/*###208 [cc] Warning: illegal pointer combination%%%*/
/*###208 [cc] Error: illegal types in :%%%*/
/*###208 [cc] Error: ImpulseHeight undefined%%%*/
			EARSTEP(i==0 ? &ImpulseHeight : &ImpulseZero, Output);
			for (j=0;j<EarLength;j++)
				OutputArray[i*EarLength + j] = Output[j+1];

			SystemCursor();

		}

		for (j=0;j<EarLength;j++){
			float	*real, *im;

			real = (float *)calloc(2*RESPONSE_LENGTH+1,
						sizeof(float));
			im = (float *)calloc(2*RESPONSE_LENGTH+1,
						sizeof(float));
			if (!real || !im){
				fprintf(stderr,"%s: Can't allocate temporary space for fft arrays.\n",
					progname);
				exit(1);
			}

			for (i=0;i<RESPONSE_LENGTH;i++){
				real[i] = Hamming[i] * 
					OutputArray[i*EarLength + j];
				im[i] = im[2*RESPONSE_LENGTH-i] = 0.0;
				real[2*RESPONSE_LENGTH-i] = 0.0;
			}

			fft(real, im, 1+LOG_RESPONSE_LENGTH, 0);

			for (i=0;i<RESPONSE_LENGTH;i++){
				float	realpart, impart;
				realpart = real[i]/IMPULSE_HEIGHT;
				impart = im[i]/IMPULSE_HEIGHT;
				OutputArray[i*EarLength + j] = 
						-10*log(realpart*realpart +
								impart*impart +
								1e-20);

				SystemCursor();
			}
		}

		fwrite(OutputArray, sizeof(float), 
			RESPONSE_LENGTH*EarLength, ofp);
		printf("Image (%s) is %dx%d.\n", ofn, 
			EarLength, RESPONSE_LENGTH);
	} else {
		int	LineCount = 0;
		int	CorrelationLineCount = 0, CorrelationPictureCount = 0;
		long	CorrelationOutputSize;
		float	*CorrelationOutput = NULL, *CorrelationZero = NULL;
		
		if (cfn || UseUltra){
			InitCorrelation(EarLength-2, 2*CorrelationLags);
			CorrelationOutputSize = (long)(EarLength + 10) * 
						CorrelationLags;
			CorrelationOutput = (float *)
						malloc(CorrelationOutputSize*
							sizeof(CorrelationOutput[0]));
			if (!CorrelationOutput){
			  fprintf(stderr, 
			  "%s: Couldn't get %ld bytes for correlation output.\n",
					argv[0], CorrelationOutputSize);
			  exit(2);
			}
		}

		for (i=0;i<DataLength;i++){
			SystemCursor();
			SampleNumber = i;

			/* Removed for SPEC
			starttimer(10);
			*/
			EARSTEP(&Data[i], Output);
			/* Removed for SPEC
			endtimer(10);
			*/
			if (!DecimationFactor || (i % DecimationFactor) == 0){
				WriteOutputFile(Output+2,EarLength-2);
			}
			if (cfn || UseUltra)
				SendInputToCorrelation(Output+2);

			if ((cfn || UseUltra)
			    && i && (i%CorrelationStep) == 0){
				Max = EarCorrelation(CorrelationOutput, 
							CorrelationLags);
				if (VideoRecord)
					RecordVideo();
				if (cfn) {
					char Name[BUFSIZ];
					sprintf(Name,"%s%05ld(%dx%d)", cfn, 
							(long)i,
							CorrelationLags,
							EarLength-2);
#ifdef	BYTEOUTPUT
					BytePicout(Name, CorrelationOutput,
						(int32)(EarLength-2)*
							CorrelationLags,
						0.0, Max);
#else
					picout(Name, CorrelationOutput,
						(int32)(EarLength-2)*
							CorrelationLags);
#endif	/* BYTEOUTPUT */
				}
				CorrelationPictureCount++;
			}
		}
		if (!UseUltra){
			if (cfn){
				printf(
				   "Correlagram (%s) is %dx%dx%d.\n",
					cfn, CorrelationLags, EarLength-2, 
					CorrelationPictureCount);
			}
		}
	}
	CloseOutputFile();

	if (ffp) 
		fclose(ffp);
	/* Removed for SPEC 
	printtimers(); 
	*/

	/* Added for SPEC 3.0 to Check for accuracy of run 06/24/91 */

#ifdef DEBUG_SPEC
	fp = fopen("data.out", "w");
	if (!fp)
	{
		fprintf(stderr, "Error opening data.out file\n");
		exit(99);
	}

	for (i = 0; i < MaxN; i++)
	{
		fprintf(fp, "%10.5E\n", Output[i]);
	}
	fclose(fp);
#else

	fp = fopen("err.out", "w");
	if (!fp)
	{
		fprintf(stderr, "Error opening err.out file\n");
		exit(99);
	}

	
	for (i = 0; i < MaxN; i++)
		fprintf(fp, "\t%10.5E\n", Output[i]);


	fclose(fp);
#endif
}

RecordVideo(void) {
}

/*
 *	RunRealTime - This is a first attempt at putting the ear model
 *	into the Cray real time queue so it runs really fast.  It doesn't
 *	work yet.
 */


RunRealTime(void) {
}



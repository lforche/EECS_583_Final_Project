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

static char     *RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/output.c,v 1.1 2002/10/05 19:42:58 ntclark Exp $";

#include        <stdlib.h>
#include	<stdio.h>
#include	"earhdr.h"

#ifdef	NOHEADER

static FILE	*ofp = NULL;
static int	LineCount = 0;
static int	LineLength = 0;
static char	*FileName = "";

OpenOutputFile(char *ofn)
{
        if (ofn && *ofn){
		FileName = ofn;
                ofp = fopen(ofn, "w");
                if (!ofp){
                        fprintf(stderr,
			    "OpenOutputFile: Can't open %s for output data.\n",
                                ofn);
                        exit(1);
                }
        }
}

WriteOutputFile(float *Data, int Length)
{
	int	i, result;
	float	max, scale;

	if (ofp) {
		if (LineLength && Length != LineLength){
		    fprintf(stderr,"WriteOutputFile: Uneven line lengths.\n");
		    fprintf(stderr," Expecting %d, got %d at line %d.\n",
			LineLength, Length, LineCount);
		    exit(1);
		}
		LineLength = Length;
				
#ifdef	TEXTOUTPUT
		for (i=0; i<Length; i++){
			fprintf(ofp, "%g\t", Data[i]);
			if ((i % 4) == 3)
				fprintf(ofp,"xxx%d\n",i);
		}
		fprintf(ofp,"\n");
#else 
#ifdef BYTEOUTPUT
		max = 2*AgcStage4Target;
		scale = 255.0/max;
		for (i=0; i<Length; i++){
			if (Data[i] < 0)
				putc(0, ofp);
			else if (Data[i] > max)
				putc(0xff, ofp);
			else
				putc((int) (Data[i] * scale + 0.5), ofp);
		}
#else	/* Not bytes or ascii.....must be floats. */
		result = fwrite(Data,sizeof(float),Length,ofp);
		if (result != Length){
			fprintf(stderr,"Couldn't write output data (%d).\n",
				result);
			CloseOutputFile();
			exit(1);
		}
#endif	/* BYTEOUTPUT */
#endif	/* TEXTOUTPUT */
		LineCount++;
	}
}

CloseOutputFile(void) {
	if (ofp) {
#ifdef	TEXTOUTPUT
		printf("Image (%s) is %dx%d (ascii text, no header).\n", 
			FileName, LineLength, LineCount);
#else
#ifdef	BYTEOUTPUT
		printf("Image (%s) is %dx%d (8 bit bytes, no header).\n", 
			FileName, LineLength, LineCount);
#else
		printf("Image (%s) is %dx%d (floating point, no header).\n", 
			FileName, LineLength, LineCount);
#endif	/* BYTEOUTPUT */
#endif	/* TEXTOUTPUT */
		fclose(ofp);
	}
}
 
#endif	/* NOHEADER */



#ifdef	OGC

				/* WARNING....this stuff is a real
				 * hack to see if things can work.
				 *	Malcolm@apple.com  1/12/89
				 */
#include	"syncstruct.h"

static	int	NumberOfFrames = 0;
static	int	StartADCIndex = 0;

struct DataStruct	{
	short	*Data;
	int	Length;
	int	Start;
	struct DataStruct *Next;
};
struct DataStruct  FirstBuffer = {NULL, 0, 0, NULL};
struct DataStruct  *LastBuffer = &FirstBuffer;

/* HACK---Just set up the first buffer.
 * Only used if OGC is defined.
 */

static FILE	*ofp;
static char	*FileName = "";
#define	MAX	(AgcStage4Target*1.5)

OpenOutputFile(ofn)
char	*ofn;
{

        if (ofn && *ofn){
		FileName = ofn;
                ofp = fopen(ofn, "w");
                if (!ofp){
                        fprintf(stderr,
			    "OpenOutputFile: Can't open %s for output data.\n",
                                ofn);
                        exit(1);
                }
		FirstBuffer.Data = NULL;
		FirstBuffer.Length = 0;
		FirstBuffer.Start = 0;
		FirstBuffer.Next = NULL;
        }
}

/* HACK --- Save the data so that we can output it all at once at
 * the end of the run.
 */
WriteOutputFile(Data,Length)
float	*Data;
int	Length;
{
	int	i;
	float	Max, sin(), log();
	struct DataStruct *NextData;
	extern	int	DecimationFactor;
	extern	float	AgcStage4Target;

	if (!ofp)
		return;

	NextData = (struct DataStruct *)malloc(sizeof(*NextData));
	if (!NextData){
		fprintf(stderr, "Can't allocate space for data struct.\n");
		exit(1);
	}

	NextData->Data = (short *) malloc(Length*
					sizeof(*NextData->Data));
	if (!NextData->Data){
		fprintf(stderr, "Can't allocate data space.\n");
		exit(1);
	}

	for (i=0;i<Length;i++){
#ifdef	TEST
		NextData->Data[i] = 100*sin(6.28/Length*i*NumberOfFrames/80);
		if (NextData->Data[i] < 0)
			NextData->Data[i] = 0;
#else	
		if (Data[i] > MAX)
			Data[i] = MAX;
		NextData->Data[i] = Data[i]/MAX * 100;
#endif	TEST
	}
	NextData->Length = Length;
	NextData->Start = StartADCIndex;
	NextData->Next = NULL;
	LastBuffer->Next = NextData;
	LastBuffer = NextData;

	NumberOfFrames++;
	StartADCIndex += (DecimationFactor < 1)? 1 : DecimationFactor;

}

/* HACK---OK, now write out the data to the file.  First write out
 * all the headers and then send out the data.
 */
CloseOutputFile()
{
	SYNC	FrameInfo;
	int	Header[2], i = 0;
	struct	DataStruct *dp;

	rewind(ofp);
	Header[0] = -1;
	Header[1] = NumberOfFrames;
	fwrite(Header,sizeof(Header[0]),2,ofp);

	for (dp = FirstBuffer.Next;dp;dp=dp->Next){
		FrameInfo.ref = dp->Start;
		FrameInfo.size = 256;		/* Fake it. */
		FrameInfo.dist = (DecimationFactor < 1)? 1 : DecimationFactor;
		FrameInfo.syncflag = 0;		/* Don't know if pitch*/
		FrameInfo.framesize = dp->Length;
		FrameInfo.frame = 0;
		FrameInfo.enersize = 0;
		FrameInfo.ener = 0;
		fwrite(&FrameInfo, sizeof(FrameInfo), 1, ofp);
		i++;
	}
	printf("Number of frames in output file %s is  %d (OGC Format).\n",
		FileName, i);

	for (dp = FirstBuffer.Next;dp;dp=dp->Next){
		for (i=dp->Length-1;i>=0;i--){
			fwrite(&dp->Data[i], sizeof(dp->Data[0]), 1, ofp);
		}
	}
}
#endif	/* OGC */


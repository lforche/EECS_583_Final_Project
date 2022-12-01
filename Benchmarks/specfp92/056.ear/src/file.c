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

static char     *RCSid = "$Header: /home/jklooste/lloth/benchmarks/specfp92/056.ear/src/file.c,v 1.1 2002/10/05 19:42:58 ntclark Exp $";


/*
 *	This file reads the input speech data in a number of different formats.
 */

#include        <stdlib.h>
#include	<stdio.h>
#include	"earhdr.h"

Read16BitsLowHigh(FILE *fp)
{
	int	first, second, result;

	first = 0xff & getc(fp);
	second = 0xff & getc(fp);

	result = (second << 8) + first;
	if (result & 0x8000)
		result = result - 0x10000;
	return(result);
}

Read16BitsHighLow(FILE *fp)
{
	int	first, second, result;

	first = 0xff & getc(fp);
	second = 0xff & getc(fp);

	result = (first << 8) + second;
	if (result & 0x8000)
		result = result - 0x10000;
	return(result);
}

Write16BitsLowHigh(FILE *fp, int i)
{
	putc(i&0xff,fp);
	putc((i>>8)&0xff,fp);
}

int32
Read32Bits(FILE *fp)
{
	int32	first, second, result;

	first = 0xffff & Read16BitsLowHigh(fp);
	second = 0xffff & Read16BitsLowHigh(fp);

	result = (second << 16) + first;
	return(result);
}
	

Write32Bits(FILE *fp, long int i)
{
	Write16BitsLowHigh(fp,(int)(i&0xffffL));
	Write16BitsLowHigh(fp,(int)((i>>16)&0xffffL));
}

float *
ReadADCFile(char *FileName, float *SamplingRate, long int *Length)
{
	register int32	i, SampleTime, n, HeaderSize;
	float	*Data;
	FILE	*fp;

	fp = fopen(FileName, "r");
	if (!fp){
		fprintf(stderr, "ReadADCFile: Couldn't open %s for reading.\n",
			FileName);
		exit(1);
	}

	HeaderSize = Read16BitsLowHigh(fp);
	HeaderSize--;
	Read16BitsLowHigh(fp);				/* Version Number */
	HeaderSize--;
	Read16BitsLowHigh(fp);				/* Channels */
	HeaderSize--;
	SampleTime = Read16BitsLowHigh(fp);
	HeaderSize--;
	n = Read32Bits(fp);
	if (MaxSamples >= 0 && n > MaxSamples) n = MaxSamples;
	HeaderSize -= 2;
	while (HeaderSize > 0){
		Read16BitsLowHigh(fp);
		HeaderSize--;
	}
	*SamplingRate = 4.0e6 / SampleTime;

	printf("Reading %ld samples from %s with sampling rate of %g.\n", 
		(long)n, FileName, *SamplingRate);
	Data = (float *)malloc(n * sizeof(*Data));
	if (!Data){
		fprintf(stderr,"ReadADCFile: Can't get space for %ld samples.\n",
			(long)n);
		exit(1);
	}
			
	for (i=0;i<n;i++)
		Data[i] = Read16BitsLowHigh(fp)/655360.0;
	
	*Length = i;
	fclose(fp);
	
	return(Data);
}

WriteADCFile(char *FileName, float SamplingRate, long int Length, float *Data)
{
	register int32	i;
	FILE	*fp;
	float	Max;

	fp = fopen(FileName, "w");
	if (!fp){
		fprintf(stderr, "WriteADCFile: Couldn't open %s for writing.\n",
			FileName);
		exit(1);
	}

	Write16BitsLowHigh(fp,6);
	Write16BitsLowHigh(fp,0);
	Write16BitsLowHigh(fp,1);
	Write16BitsLowHigh(fp,(int) (4.0e6/SamplingRate));
	Write32Bits(fp,(long) Length);

	Max = Data[0];
	for (i=1;i<Length;i++)
		if (Data[i] > Max)
			Max = Data[i];

	printf("Writing %s with sample rate %f and length %ld.\n",
		FileName, SamplingRate, Length);
	printf(" Maximum value of file is %g.\n", Max);

	Max = ((1<<12)-1)/Max;
	for (i=0;i<Length;i++)
		Write16BitsLowHigh(fp,(int)(Data[i]*Max));
	
	fclose(fp);
}

int32
FileLength(FILE *fp)
{
	int	pos, end;

	pos = ftell(fp);
	fseek(fp, 0L, 2);
	end = ftell(fp);
	fseek(fp,pos,0);
	return(end);
}

float *
ReadWavFile(char *FileName, long int *Length)
{
	register int32	i;
	float	*Data;
	FILE	*fp;

	fp = fopen(FileName, "r");
	if (!fp){
		fprintf(stderr, "ReadByteFile: Couldn't open %s for reading.\n",
			FileName);
		exit(1);
	}

	*Length = FileLength(fp);
	if (MaxSamples >= 0 && *Length > MaxSamples) *Length = MaxSamples;

	Data = (float *)malloc(*Length * sizeof(*Data));
	if (!Data){
		fprintf(stderr,
			"ReadByteFile: Can't get space for %d samples.\n",
			*Length);
		exit(1);
	}
	
	for (i=0;i<*Length;i++)
		Data[i] = Read16BitsLowHigh(fp)/327680.0;
	
	return(Data);
}


float *
ReadByteFile(char *FileName, long int *Length)
{
	register int	i;
	float	*Data;
	FILE	*fp;

	fp = fopen(FileName, "r");
	if (!fp){
		fprintf(stderr, "ReadByteFile: Couldn't open %s for reading.\n",
			FileName);
		exit(1);
	}

	*Length = FileLength(fp);
	if (MaxSamples >= 0 && *Length > MaxSamples) *Length = MaxSamples;

	Data = (float *)malloc(*Length * sizeof(*Data));
	if (!Data){
		fprintf(stderr,
			"ReadByteFile: Can't get space for %d samples.\n",
			*Length);
		exit(1);
	}
	
	for (i=0;i<*Length;i++)
		Data[i] = ((getc(fp) & 0xff) - 0x80)/1280.0;
	
	return(Data);
}

WriteByteFile(char *FileName, long int Length, float *Data)
{
	register int32	i;
	FILE	*fp;
	float	Max;

	fp = fopen(FileName, "w");
	if (!fp){
		fprintf(stderr, "WriteByteFile: Couldn't open %s for writing.\n",
			FileName);
		exit(1);
	}

	Max = Data[0];
	for (i=1;i<Length;i++)
		if (Data[i] > Max)
			Max = Data[i];

	printf("Writing byte file %s with length %ld.\n",
		FileName, Length);
	printf(" Maximum value of file is %g.\n", Max);

	Max = 127/Max;
	for (i=0;i<Length;i++)
		putc((int)(Data[i]*Max)+128,fp);
	
	fclose(fp);
}

/* Dyaxis file: 512-byte header, 16-bit stereo interleaved samples
 * with left channel first.  Each sample has high byte first.
 */
float *ReadDyaxisFile(char *FileName, long int *Length)
{
	register int	i;
	float	*Data;
	FILE	*fp;
	long len;

	fp = fopen(FileName, "r");
	if (!fp){
	    fprintf(stderr, "ReadByteFile: Couldn't open %s for reading.\n",
		    FileName);
	    exit(1);
	}

	len = FileLength(fp);		/* length in bytes */
	*Length = (len - 512) / 4;	/* left-channel samples in file */
	if (MaxSamples >= 0 && *Length > MaxSamples) *Length = MaxSamples;
	
	Data = (float *)malloc(*Length * sizeof(*Data));
	if (!Data){
		fprintf(stderr,
			"ReadByteFile: Can't get space for %d samples.\n",
			*Length);
		exit(1);
	}
	
	for (i=0;i<*Length;i++) {
	    Data[i] = Read16BitsHighLow(fp) / 327680.0;	/* left */
	    Read16BitsHighLow(fp);			/* right (ignored) */
	}
	
	return(Data);
}

/* NeXT file: Variable-length header, then 16-bit samples (interleaved
 * if stereo).
 */
float *ReadNeXTFile(char *FileName, long int *Length, float *SamplingRate)
{
	register int	i, stereo;
	float	*Data;
	FILE	*fp;
	struct {
		char suffix[4];		/* ".snd" */
		long hdr_len,		/* header length following ".snd" */
			data_len,		/* data len, in bytes */
			mode,			/* 3 ==> 16-bit linear */
			srate,
			nChannels;		/* 1 for mono, 2 for stereo */
	} header;

	fp = fopen(FileName, "r");
	if (!fp) 
		fileAbort("Couldn't open %s for reading.\n", FileName);
	if (fread(&header, sizeof(header), 1, fp) != 1)
		fileAbort("Can't read header of %s.\n", FileName);
	if (header.mode != 3) 
	    fileAbort("Sound file %s is not 16-bit linear (mode 3).\n", FileName);
	fseek(fp, header.hdr_len + 4, 0);	/* skip comment */

	*SamplingRate = header.srate;
	stereo = (header.nChannels == 2);
	*Length = header.data_len / 2;	
	if (stereo) *Length /= 2;
	if (MaxSamples >= 0 && *Length > MaxSamples) *Length = MaxSamples;
	
	Data = (float *)malloc(*Length * sizeof(*Data));
	if (!Data) 
		fileAbort("Can't get space for %d samples.\n", *Length);
	
	for (i = 0; i < *Length; i++) {
	    Data[i] = Read16BitsHighLow(fp) / 327680.0;	/* left */
	    if (stereo) Read16BitsHighLow(fp);		/* right (ignored) */
	}
	
	return Data;
}

fileAbort(char *str, char *arg)
{
	fprintf(stderr, "Reading data file: ");
	fprintf(stderr, str, arg);
	exit(1);
}
	
float *
ReadNativeFloatFile(char *FileName, long int *Length)
{
	register int32	i;
	float	*Data;
	FILE	*fp;

	fp = fopen(FileName, "r");
	if (!fp){
		fprintf(stderr, "ReadByteFile: Couldn't open %s for reading.\n",
			FileName);
		exit(1);
	}

	*Length = FileLength(fp)/sizeof(float);
	if (MaxSamples >= 0 && *Length > MaxSamples) *Length = MaxSamples;

	Data = (float *)malloc((int32)*Length * sizeof(*Data));
	if (!Data){
		fprintf(stderr,
			"ReadByteFile: Can't get space for %d samples.\n",
			*Length);
		exit(1);
	}
	
	fread(Data,sizeof(float),*Length,fp);
	
	return(Data);
}

char	*
GetFileSuffix(char *FileName)
{
	char *p;

	for (p=FileName;*p;p++);

	for (;*p != '.' && p >= FileName;p--);

	if (*p == '.')
		return(p+1);
	else 
		return(FileName);
}

float *
ReadInputFile(char *FileName, float *SamplingRate, long int *Length)
{
	char	*Suffix;
	float	*Data = NULL;

	Suffix = GetFileSuffix(FileName);
	if (strncmp(Suffix,"adc",3) == 0 || strncmp(Suffix,"ADC",3) == 0)
		Data = ReadADCFile(FileName,SamplingRate,Length);
	else if (strncmp(Suffix,"wav",3) == 0 || strncmp(Suffix,"WAV",3) == 0){
		Data = ReadWavFile(FileName,Length);
		*SamplingRate = 16000;
	} else if (strncmp(Suffix,"m22",3) == 0 || strncmp(Suffix,"M22",3) == 0){
		*SamplingRate = 22254.5454545454545454;
		Data = ReadByteFile(FileName,Length);
	} else if (strncmp(Suffix,"m11",3) == 0 || strncmp(Suffix,"M11",3) == 0){
		*SamplingRate = 22254.5454545454545454/2;
		Data = ReadByteFile(FileName,Length);
	} else if (strncmp(Suffix,"m7",2) == 0 || strncmp(Suffix,"M7",2) == 0){
		*SamplingRate = 7000;
		Data = ReadByteFile(FileName,Length);
	} else if (strncmp(Suffix,"dy22",4) == 0 || strncmp(Suffix,"DY22",4) == 0){
		*SamplingRate = 22050;
		Data = ReadDyaxisFile(FileName,Length);
	} else if (strncmp(Suffix,"dy44",4) == 0 || strncmp(Suffix,"DY44",4) == 0){
		*SamplingRate = 44100;
		Data = ReadDyaxisFile(FileName,Length);
	} else if (strncmp(Suffix,"snd",3) == 0) {
		/* sampling rate comes from the file */
		Data = ReadNeXTFile(FileName,Length,SamplingRate);
	} else if (strncmp(Suffix,"fl",2) == 0 || strncmp(Suffix,"FL",2) == 0){
		*SamplingRate = 16000;
		Data = ReadNativeFloatFile(FileName, Length);
	} else {
		fprintf(stderr, "Can't open input file '%s'\n", FileName);
		exit(1);
	}
#ifdef	VERBOSE
	picout("Input.output",Data,sizeof(*Data)* *Length);
#endif	/* VERBOSE */
	return(Data);
}

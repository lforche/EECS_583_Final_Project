/* xlprint - xlisp print routine */
/*	Copyright (c) 1985, by David Michael Betz
	All Rights Reserved
	Permission is granted for unrestricted non-commercial use	*/

#include "xlisp.h"

#ifdef MEGAMAX
overlay "io"
#endif

/* external variables */
extern char buf[];

/* xlprint - print an xlisp value */
void xlprint(fptr,vptr,flag)
  NODE *fptr,*vptr; int flag;
{
    NODE *nptr;
    NODE *next = NIL;
    int n,i;

    /* print nil */
    if (vptr == NIL) {
	xlputstr(fptr,"NIL");
	return;
    }

    /* check value type */
    switch (ntype(vptr)) {
    case SUBR:
	    putatm(fptr,"Subr",vptr);
	    break;
    case FSUBR:
	    putatm(fptr,"FSubr",vptr);
	    break;
    case LIST:
	    xlputc(fptr,'(');
	    for (nptr = vptr; nptr != NIL; nptr = next) {
	        xlprint(fptr,car(nptr),flag);
		if (next = cdr(nptr))
		    if (consp(next))
			xlputc(fptr,' ');
		    else {
			xlputstr(fptr," . ");
			xlprint(fptr,next,flag);
			break;
		    }
	    }
	    xlputc(fptr,')');
	    break;
    case SYM:
	    xlputstr(fptr,getstring(getpname(vptr)));
	    break;
    case INT:
	    putdec(fptr,getfixnum(vptr));
	    break;
    case FLOAT:
	    putfloat(fptr,getflonum(vptr));
	    break;
    case STR:
	    if (flag)
		putstring(fptr,getstring(vptr));
	    else
		xlputstr(fptr,getstring(vptr));
	    break;
    case FPTR:
	    putatm(fptr,"File",vptr);
	    break;
    case OBJ:
	    putatm(fptr,"Object",vptr);
	    break;
    case VECT:
	    xlputc(fptr,'#'); xlputc(fptr,'(');
	    for (i = 0, n = getsize(vptr); n-- > 0; ) {
		xlprint(fptr,getelement(vptr,i++),flag);
		if (n) xlputc(fptr,' ');
	    }
	    xlputc(fptr,')');
	    break;
    case FREE:
	    putatm(fptr,"Free",vptr);
	    break;
    default:
	    putatm(fptr,"Foo",vptr);
	    break;
    }
}

/* xlterpri - terminate the current print line */
xlterpri(fptr)
  NODE *fptr;
{
    xlputc(fptr,'\n');
}

/* xlputstr - output a string */
xlputstr(fptr,str)
  NODE *fptr; char *str;
{
    while (*str)
	xlputc(fptr,*str++);
}

/* putstring - output a string */
LOCAL putstring(fptr,str)
  NODE *fptr; char *str;
{
    int ch;

    /* output the initial quote */
    xlputc(fptr,'"');

    /* output each character in the string */
    while (ch = *str++)

	/* check for a control character */
	if (ch < 040 || ch == '\\') {
	    xlputc(fptr,'\\');
	    switch (ch) {
	    case '\033':
		    xlputc(fptr,'e');
		    break;
	    case '\n':
		    xlputc(fptr,'n');
		    break;
	    case '\r':
		    xlputc(fptr,'r');
		    break;
	    case '\t':
		    xlputc(fptr,'t');
		    break;
	    case '\\':
		    xlputc(fptr,'\\');
		    break;
	    default:
		    putoct(fptr,ch);
		    break;
	    }
	}

	/* output a normal character */
	else
	    xlputc(fptr,ch);

    /* output the terminating quote */
    xlputc(fptr,'"');
}

/* putatm - output an atom */
LOCAL putatm(fptr,tag,val)
  NODE *fptr; char *tag; NODE *val;
{
    sprintf(buf,"#<%s: #",tag); xlputstr(fptr,buf);
    sprintf(buf,AFMT,val); xlputstr(fptr,buf);
    xlputc(fptr,'>');
}

/* putdec - output a decimal number */
LOCAL putdec(fptr,n)
  NODE *fptr; FIXNUM n;
{
    sprintf(buf,IFMT,n);
    xlputstr(fptr,buf);
}

/* putfloat - output a floating point number */
LOCAL putfloat(fptr,n)
  NODE *fptr; FLONUM n;
{
    sprintf(buf,"%g",n);
    xlputstr(fptr,buf);
}

/* putoct - output an octal byte value */
LOCAL putoct(fptr,n)
  NODE *fptr; int n;
{
    sprintf(buf,"%03o",n);
    xlputstr(fptr,buf);
}


/* LINTLIBRARY */

#include <stdio.h>
#include "util.h"


/*
 *  util_print_time -- massage a long which represents a time interval in
 *  milliseconds, into a string suitable for output 
 *
 *  Hack for IBM/PC -- avoids using floating point
 */

char *
util_print_time(t)
long t;
{
    static char s[40];

#if 0
    (void) sprintf(s, "%ld.%02ld sec", t/1000, (t%1000)/10);
#else
    (void) sprintf(s, "**** sec");
#endif
    return s;
}

/* Added to support 64-bit pointers (implicit decls assume
	return type int which is only 32 bits. MCM 7/2000 */

#include <string.h>
#include <malloc.h>
extern void *xmalloc();
extern void *xrealloc();
extern char *oballoc ();
extern char *permalloc ();
extern char *alloca ();

#define USG

#include "xm-m68k.h"

#define bcopy(a,b,c) memcpy (b,a,c)
#define bzero(a,b) memset (a,0,b)
#define bcmp(a,b,c) memcmp (a,b,c)

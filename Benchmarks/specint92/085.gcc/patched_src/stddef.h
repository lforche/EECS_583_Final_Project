#ifndef _STDDEF_H
#define _STDDEF_H

/* Signed type of difference of two pointers.  */

/* IMPACT FIX */
#if !(defined(__sys_stdtypes_h))
typedef long ptrdiff_t;
#endif

/* Unsigned type of `sizeof' something.  */

/* IMPACT FIX */
#if !(defined(_SIZE_T) || defined(__sys_stdtypes_h))
typedef unsigned long size_t;
#endif

/* A null pointer constant.  */

#define NULL ((void *)0)

/* Offset of member MEMBER in a struct of type TYPE.  */

#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)

#endif /* _STDDEF_H */

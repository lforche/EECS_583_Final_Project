/* xlobj - xlisp object functions */
/*	Copyright (c) 1985, by David Michael Betz
	All Rights Reserved
	Permission is granted for unrestricted non-commercial use	*/

#include "xlisp.h"

#ifdef MEGAMAX
overlay "overflow"
#endif

/* external variables */
extern NODE ***xlstack,*xlenv;
extern NODE *s_stdout;
extern NODE *self,*msgclass,*msgcls,*class,*object;
extern NODE *new,*isnew;

/* instance variable numbers for the class 'Class' */
#define MESSAGES	0	/* list of messages */
#define IVARS		1	/* list of instance variable names */
#define CVARS		2	/* list of class variable names */
#define CVALS		3	/* list of class variable values */
#define SUPERCLASS	4	/* pointer to the superclass */
#define IVARCNT		5	/* number of class instance variables */
#define IVARTOTAL	6	/* total number of instance variables */

/* number of instance variables for the class 'Class' */
#define CLASSSIZE	7

/* forward declarations */
FORWARD NODE *entermsg();
FORWARD NODE *findmsg();
FORWARD NODE *sendmsg();

/* xlclass - define a class */
NODE *xlclass(name,vcnt)
  char *name; int vcnt;
{
    NODE *sym,*cls;

    /* create the class */
    sym = xlsenter(name);
    cls = newobject(class,CLASSSIZE);
    setvalue(sym,cls);

    /* set the instance variable counts */
    setivar(cls,IVARCNT,cvfixnum((FIXNUM)vcnt));
    setivar(cls,IVARTOTAL,cvfixnum((FIXNUM)vcnt));

    /* set the superclass to 'Object' */
    setivar(cls,SUPERCLASS,object);

    /* return the new class */
    return (cls);
}

/* xladdivar - enter an instance variable */
xladdivar(cls,var)
  NODE *cls; char *var;
{
    setivar(cls,IVARS,cons(xlsenter(var),getivar(cls,IVARS)));
}

/* xladdmsg - add a message to a class */
xladdmsg(cls,msg,code)
  NODE *cls; char *msg; NODE *(*code)();
{
    NODE *mptr;

    /* enter the message selector */
    mptr = entermsg(cls,xlsenter(msg));

    /* store the method for this message */
    rplacd(mptr,cvsubr(code,SUBR));
}

/* xlsend - send a message to an object (message in arg list) */
NODE *xlsend(obj,args)
  NODE *obj,*args;
{
    NODE ***oldstk,*arglist,*msg,*val;

    /* find the message binding for this message */
    if ((msg = findmsg(getclass(obj),xlevmatch(SYM,&args))) == NIL)
	xlfail("no method for this message");

    /* evaluate the arguments and send the message */
    oldstk = xlsave(&arglist,(NODE **)NULL);
    arglist = xlevlist(args);
    val = sendmsg(obj,msg,arglist);
    xlstack = oldstk;

    /* return the result */
    return (val);
}

/* xlobgetvalue - get the value of an instance variable */
int xlobgetvalue(sym,pval)
  NODE *sym,**pval;
{
    NODE *obj,*cls,*names;
    int ivtotal,n;

    /* get the current object and the message class */
    obj = xlygetvalue(self);
    cls = xlygetvalue(msgclass);
    if (!(objectp(obj) && objectp(cls)))
	return (FALSE);

    /* find the instance or class variable */
    for (; objectp(cls); cls = getivar(cls,SUPERCLASS)) {

	/* check the instance variables */
	names = getivar(cls,IVARS);
	ivtotal = getivcnt(cls,IVARTOTAL);
	for (n = ivtotal - getivcnt(cls,IVARCNT); n < ivtotal; ++n) {
	    if (car(names) == sym) {
		*pval = getivar(obj,n);
		return (TRUE);
	    }
	    names = cdr(names);
	}

	/* check the class variables */
	names = getivar(cls,CVARS);
	for (n = 0; consp(names); ++n) {
	    if (car(names) == sym) {
		*pval = getelement(getivar(cls,CVALS),n);
		return (TRUE);
	    }
	    names = cdr(names);
	}
    }

    /* variable not found */
    return (FALSE);
}

/* xlobsetvalue - set the value of an instance variable */
int xlobsetvalue(sym,val)
  NODE *sym,*val;
{
    NODE *obj,*cls,*names;
    int ivtotal,n;

    /* get the current object and the message class */
    obj = xlygetvalue(self);
    cls = xlygetvalue(msgclass);
    if (!(objectp(obj) && objectp(cls)))
	return (FALSE);

    /* find the instance or class variable */
    for (; objectp(cls); cls = getivar(cls,SUPERCLASS)) {

	/* check the instance variables */
	names = getivar(cls,IVARS);
	ivtotal = getivcnt(cls,IVARTOTAL);
	for (n = ivtotal - getivcnt(cls,IVARCNT); n < ivtotal; ++n) {
	    if (car(names) == sym) {
		setivar(obj,n,val);
		return (TRUE);
	    }
	    names = cdr(names);
	}

	/* check the class variables */
	names = getivar(cls,CVARS);
	for (n = 0; consp(names); ++n) {
	    if (car(names) == sym) {
		setelement(getivar(cls,CVALS),n,val);
		return (TRUE);
	    }
	    names = cdr(names);
	}
    }

    /* variable not found */
    return (FALSE);
}

/* obisnew - default 'isnew' method */
LOCAL NODE *obisnew(args)
  NODE *args;
{
    xllastarg(args);
    return (xlygetvalue(self));
}

/* obclass - get the class of an object */
LOCAL NODE *obclass(args)
  NODE *args;
{
    /* make sure there aren't any arguments */
    xllastarg(args);

    /* return the object's class */
    return (getclass(xlygetvalue(self)));
}

/* obshow - show the instance variables of an object */
LOCAL NODE *obshow(args)
  NODE *args;
{
    NODE ***oldstk,*fptr,*obj,*cls,*names;
    int ivtotal,n;

    /* create a new stack frame */
    oldstk = xlsave(&fptr,(NODE **)NULL);

    /* get the file pointer */
    fptr = (args ? xlgetfile(&args) : getvalue(s_stdout));
    xllastarg(args);

    /* get the object and its class */
    obj = xlygetvalue(self);
    cls = getclass(obj);

    /* print the object and class */
    xlputstr(fptr,"Object is ");
    xlprint(fptr,obj,TRUE);
    xlputstr(fptr,", Class is ");
    xlprint(fptr,cls,TRUE);
    xlterpri(fptr);

    /* print the object's instance variables */
    for (cls = getclass(obj); cls; cls = getivar(cls,SUPERCLASS)) {
	names = getivar(cls,IVARS);
	ivtotal = getivcnt(cls,IVARTOTAL);
	for (n = ivtotal - getivcnt(cls,IVARCNT); n < ivtotal; ++n) {
	    xlputstr(fptr,"  ");
	    xlprint(fptr,car(names),TRUE);
	    xlputstr(fptr," = ");
	    xlprint(fptr,getivar(obj,n),TRUE);
	    xlterpri(fptr);
	    names = cdr(names);
	}
    }

    /* restore the previous stack frame */
    xlstack = oldstk;

    /* return the object */
    return (obj);
}

/* obsendsuper - send a message to an object's superclass */
LOCAL NODE *obsendsuper(args)
  NODE *args;
{
    NODE *obj,*super,*msg;

    /* get the object */
    obj = xlygetvalue(self);

    /* get the object's superclass */
    super = getivar(getclass(obj),SUPERCLASS);

    /* find the message binding for this message */
    if ((msg = findmsg(super,xlmatch(SYM,&args))) == NIL)
	xlfail("no method for this message");

    /* send the message */
    return (sendmsg(obj,msg,args));
}

/* clnew - create a new object instance */
LOCAL NODE *clnew()
{
    NODE *cls;
    cls = xlygetvalue(self);
    return (newobject(cls,getivcnt(cls,IVARTOTAL)));
}

/* clisnew - initialize a new class */
LOCAL NODE *clisnew(args)
  NODE *args;
{
    NODE *ivars,*cvars,*super,*cls;
    int n;

    /* get the ivars, cvars and superclass */
    ivars = xlmatch(LIST,&args);
    cvars = (args ? xlmatch(LIST,&args) : NIL);
    super = (args ? xlmatch(OBJ,&args) : object);
    xllastarg(args);

    /* get the new class object */
    cls = xlygetvalue(self);

    /* store the instance and class variable lists and the superclass */
    setivar(cls,IVARS,ivars);
    setivar(cls,CVARS,cvars);
    setivar(cls,CVALS,newvector(listlength(cvars)));
    setivar(cls,SUPERCLASS,super);

    /* compute the instance variable count */
    n = listlength(ivars);
    setivar(cls,IVARCNT,cvfixnum((FIXNUM)n));
    n += getivcnt(super,IVARTOTAL);
    setivar(cls,IVARTOTAL,cvfixnum((FIXNUM)n));

    /* return the new class object */
    return (cls);
}

/* clanswer - define a method for answering a message */
LOCAL NODE *clanswer(args)
  NODE *args;
{
    NODE ***oldstk,*arg,*msg,*fargs,*code,*obj,*mptr;

    /* create a new stack frame */
    oldstk = xlsave(&arg,&msg,&fargs,&code,(NODE **)NULL);

    /* initialize */
    arg = args;

    /* message symbol, formal argument list and code */
    msg = xlmatch(SYM,&arg);
    fargs = xlmatch(LIST,&arg);
    code = xlmatch(LIST,&arg);
    xllastarg(arg);

    /* get the object node */
    obj = xlygetvalue(self);

    /* make a new message list entry */
    mptr = entermsg(obj,msg);

    /* setup the message node */
    rplacd(mptr,cons(fargs,code));

    /* restore the previous stack frame */
    xlstack = oldstk;

    /* return the object */
    return (obj);
}

/* entermsg - add a message to a class */
LOCAL NODE *entermsg(cls,msg)
  NODE *cls,*msg;
{
    NODE ***oldstk,*lptr,*mptr;

    /* lookup the message */
    for (lptr = getivar(cls,MESSAGES); lptr; lptr = cdr(lptr))
	if (car(mptr = car(lptr)) == msg)
	    return (mptr);

    /* allocate a new message entry if one wasn't found */
    oldstk = xlsave(&mptr,(NODE **)NULL);
    mptr = consa(msg);
    setivar(cls,MESSAGES,cons(mptr,getivar(cls,MESSAGES)));
    xlstack = oldstk;

    /* return the symbol node */
    return (mptr);
}

/* findmsg - find the message binding given an object and a class */
LOCAL NODE *findmsg(cls,sym)
  NODE *cls,*sym;
{
    NODE *lptr,*msg;

    /* look for the message in the class or superclasses */
    for (msgcls = cls; msgcls != NIL; ) {

	/* lookup the message in this class */
	for (lptr = getivar(msgcls,MESSAGES); lptr != NIL; lptr = cdr(lptr))
	    if ((msg = car(lptr)) != NIL && car(msg) == sym)
		return (msg);

	/* look in class's superclass */
	msgcls = getivar(msgcls,SUPERCLASS);
    }

    /* message not found */
    return (NIL);
}

/* sendmsg - send a message to an object */
LOCAL NODE *sendmsg(obj,msg,args)
  NODE *obj,*msg,*args;
{
    NODE ***oldstk,*oldenv,*newenv,*method,*cptr,*val,*isnewmsg;

    /* create a new stack frame */
    oldstk = xlsave(&oldenv,&newenv,&method,&cptr,&val,(NODE **)NULL);

    /* get the method for this message */
    method = cdr(msg);

    /* make sure its a function or a subr */
    if (!subrp(method) && !consp(method))
	xlfail("bad method");

    /* create a new environment frame */
    newenv = xlframe(NIL);
    oldenv = xlenv;

    /* bind the symbols 'self' and 'msgclass' */
    xlbind(self,obj,newenv);
    xlbind(msgclass,msgcls,newenv);

    /* evaluate the function call */
    if (subrp(method)) {
	xlenv = newenv;
	val = (*getsubr(method))(args);
    }
    else {

	/* bind the formal arguments */
	xlabind(car(method),args,newenv);
	xlenv = newenv;

	/* execute the code */
	cptr = cdr(method);
	while (cptr)
	    val = xlevarg(&cptr);
    }

    /* restore the environment */
    xlenv = oldenv;

    /* after creating an object, send it the "isnew" message */
    if (car(msg) == new && val) {
	if ((isnewmsg = findmsg(getclass(val),isnew)) == NIL)
	    xlfail("no method for the isnew message");
	sendmsg(val,isnewmsg,args);
    }

    /* restore the previous stack frame */
    xlstack = oldstk;

    /* return the result value */
    return (val);
}

/* getivcnt - get the number of instance variables for a class */
LOCAL int getivcnt(cls,ivar)
  NODE *cls; int ivar;
{
    NODE *cnt;
    if ((cnt = getivar(cls,ivar)) == NIL || !fixp(cnt))
	xlfail("bad value for instance variable count");
    return ((int)getfixnum(cnt));
}

/* listlength - find the length of a list */
LOCAL int listlength(list)
  NODE *list;
{
    int len;
    for (len = 0; consp(list); len++)
	list = cdr(list);
    return (len);
}

/* xloinit - object function initialization routine */
xloinit()
{
    /* don't confuse the garbage collector */
    class = object = NIL;

    /* enter the object related symbols */
    self	= xlsenter("SELF");
    msgclass	= xlsenter("MSGCLASS");
    new		= xlsenter(":NEW");
    isnew	= xlsenter(":ISNEW");

    /* create the 'Class' object */
    class = xlclass("CLASS",CLASSSIZE);
    setelement(class,0,class);

    /* create the 'Object' object */
    object = xlclass("OBJECT",0);

    /* finish initializing 'class' */
    setivar(class,SUPERCLASS,object);
    xladdivar(class,"IVARTOTAL");	/* ivar number 6 */
    xladdivar(class,"IVARCNT");		/* ivar number 5 */
    xladdivar(class,"SUPERCLASS");	/* ivar number 4 */
    xladdivar(class,"CVALS");		/* ivar number 3 */
    xladdivar(class,"CVARS");		/* ivar number 2 */
    xladdivar(class,"IVARS");		/* ivar number 1 */
    xladdivar(class,"MESSAGES");	/* ivar number 0 */
    xladdmsg(class,":NEW",clnew);
    xladdmsg(class,":ISNEW",clisnew);
    xladdmsg(class,":ANSWER",clanswer);

    /* finish initializing 'object' */
    xladdmsg(object,":ISNEW",obisnew);
    xladdmsg(object,":CLASS",obclass);
    xladdmsg(object,":SHOW",obshow);
    xladdmsg(object,":SENDSUPER",obsendsuper);
}


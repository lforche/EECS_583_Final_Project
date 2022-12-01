
# line 10 "gram.y"
#include "x.h"
#include <stdio.h>
#include <ctype.h>
BNODE *new_bnode(), *copy_bnode();
extern char yytext[];
extern BNODE *exprs[];
extern int noutputs;

# line 19 "gram.y"
typedef union  {
	BNODE *bnodeval;
	int intval;
} YYSTYPE;
# define NAME 257
# define INORDER 258
# define OUTORDER 259
# define PLANAME 260
# define SYMONE 261
# define SYMZERO 262
#define yyclearin yychar = -1
#define yyerrok yyerrflag = 0
extern int yychar;
extern int yyerrflag;
#ifndef YYMAXDEPTH
#define YYMAXDEPTH 150
#endif
YYSTYPE yylval, yyval;
typedef int yytabelem;
# define YYERRCODE 256

# line 91 "gram.y"

yytabelem yyexca[] ={
-1, 1,
	0, -1,
	-2, 0,
-1, 2,
	0, 1,
	-2, 0,
	};
# define YYNPROD 25
# define YYLAST 230
yytabelem yyact[]={

    23,     3,     8,     4,     5,     6,    33,    30,    31,    21,
     8,    17,    38,    14,    38,    26,    28,    43,    13,    12,
    11,    35,    10,    22,    38,     7,     1,    24,    20,     9,
    29,    18,    15,    36,     2,     0,     0,     0,    19,    16,
     0,     0,     0,    32,    34,     0,     0,    39,     0,     0,
     0,     0,     0,     0,    40,     0,     0,     0,     0,     0,
     0,    41,    42,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,    37,     0,
    37,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     8,     0,    17,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,    17,     0,     0,     0,    27,    25 };
yytabelem yypact[]={

  -255, -1000,  -255,   -37,   -41,   -42,   -43,   -48, -1000, -1000,
 -1000,  -246,  -247,  -248,   -33,   -51, -1000, -1000,   -53, -1000,
   -38, -1000,   -26,   -33, -1000, -1000, -1000, -1000, -1000, -1000,
   -33, -1000, -1000, -1000, -1000, -1000, -1000,   -33,   -33, -1000,
   -24,   -14, -1000, -1000 };
yytabelem yypgo[]={

     0,    27,    25,    23,    26,    34,    32,    31,    28 };
yytabelem yyr1[]={

     0,     4,     4,     5,     5,     5,     5,     5,     6,     6,
     7,     7,     3,     3,     3,     3,     3,     3,     3,     3,
     3,     3,     2,     1,     8 };
yytabelem yyr2[]={

     0,     2,     4,     4,     8,     8,     8,     9,     2,     4,
     2,     4,     7,     7,     5,     3,     3,     3,     3,     3,
     3,     7,     3,     3,     3 };
yytabelem yychk[]={

 -1000,    -4,    -5,   256,   258,   259,   260,    -2,   257,    -4,
    59,    61,    61,    61,    61,    -6,    -1,   257,    -7,    -2,
    -8,   257,    -3,    33,    -1,   262,    48,   261,    49,    63,
    40,    59,    -1,    59,    -2,    59,    59,   124,    38,    -3,
    -3,    -3,    -3,    41 };
yytabelem yydef[]={

     0,    -2,    -2,     0,     0,     0,     0,     0,    22,     2,
     3,     0,     0,     0,     0,     0,     8,    23,     0,    10,
     0,    24,     0,     0,    15,    16,    17,    18,    19,    20,
     0,     4,     9,     5,    11,     6,     7,     0,     0,    14,
     0,    12,    13,    21 };
typedef struct { char *t_name; int t_val; } yytoktype;
#ifndef YYDEBUG
#	define YYDEBUG	0	/* don't allow debugging */
#endif

#if YYDEBUG

yytoktype yytoks[] =
{
	"|",	124,
	"&",	38,
	"NAME",	257,
	"INORDER",	258,
	"OUTORDER",	259,
	"PLANAME",	260,
	"SYMONE",	261,
	"SYMZERO",	262,
	"-unknown-",	-1	/* ends search */
};

char * yyreds[] =
{
	"-no such reduction-",
	"prog : stat",
	"prog : stat prog",
	"stat : error ';'",
	"stat : INORDER '=' inlist ';'",
	"stat : OUTORDER '=' outlist ';'",
	"stat : PLANAME '=' planame ';'",
	"stat : output '=' expr ';'",
	"inlist : input",
	"inlist : inlist input",
	"outlist : output",
	"outlist : outlist output",
	"expr : expr '|' expr",
	"expr : expr '&' expr",
	"expr : '!' expr",
	"expr : input",
	"expr : SYMZERO",
	"expr : '0'",
	"expr : SYMONE",
	"expr : '1'",
	"expr : '?'",
	"expr : '(' expr ')'",
	"output : NAME",
	"input : NAME",
	"planame : NAME",
};
#endif /* YYDEBUG */

/*
** Skeleton parser driver for yacc output
*/

/*
** yacc user known macros and defines
*/
#define YYERROR		goto yyerrlab
#define YYACCEPT	return(0)
#define YYABORT		return(1)
#define YYBACKUP( newtoken, newvalue )\
{\
	if ( yychar >= 0 || ( yyr2[ yytmp ] >> 1 ) != 1 )\
	{\
		yyerror( "syntax error - cannot backup" );\
		goto yyerrlab;\
	}\
	yychar = newtoken;\
	yystate = *yyps;\
	yylval = newvalue;\
	goto yynewstate;\
}
#define YYRECOVERING()	(!!yyerrflag)
#ifndef YYDEBUG
#	define YYDEBUG	1	/* make debugging available */
#endif

/*
** user known globals
*/
int yydebug;			/* set to 1 to get debugging */

/*
** driver internal defines
*/
#define YYFLAG		(-1000)

/*
** global variables used by the parser
*/
YYSTYPE yyv[ YYMAXDEPTH ];	/* value stack */
int yys[ YYMAXDEPTH ];		/* state stack */

YYSTYPE *yypv;			/* top of value stack */
int *yyps;			/* top of state stack */

int yystate;			/* current state */
int yytmp;			/* extra var (lasts between blocks) */

int yynerrs;			/* number of errors */
int yyerrflag;			/* error recovery flag */
int yychar;			/* current input token number */



/*
** yyparse - return 0 if worked, 1 if syntax error not recovered from
*/
int
yyparse()
{
	register YYSTYPE *yypvt;	/* top of value stack for $vars */

	/*
	** Initialize externals - yyparse may be called more than once
	*/
	yypv = &yyv[-1];
	yyps = &yys[-1];
	yystate = 0;
	yytmp = 0;
	yynerrs = 0;
	yyerrflag = 0;
	yychar = -1;

	goto yystack;
	{
		register YYSTYPE *yy_pv;	/* top of value stack */
		register int *yy_ps;		/* top of state stack */
		register int yy_state;		/* current state */
		register int  yy_n;		/* internal state number info */

		/*
		** get globals into registers.
		** branch to here only if YYBACKUP was called.
		*/
	yynewstate:
		yy_pv = yypv;
		yy_ps = yyps;
		yy_state = yystate;
		goto yy_newstate;

		/*
		** get globals into registers.
		** either we just started, or we just finished a reduction
		*/
	yystack:
		yy_pv = yypv;
		yy_ps = yyps;
		yy_state = yystate;

		/*
		** top of for (;;) loop while no reductions done
		*/
	yy_stack:
		/*
		** put a state and value onto the stacks
		*/
#if YYDEBUG
		/*
		** if debugging, look up token value in list of value vs.
		** name pairs.  0 and negative (-1) are special values.
		** Note: linear search is used since time is not a real
		** consideration while debugging.
		*/
		if ( yydebug )
		{
			register int yy_i;

			printf( "State %d, token ", yy_state );
			if ( yychar == 0 )
				printf( "end-of-file\n" );
			else if ( yychar < 0 )
				printf( "-none-\n" );
			else
			{
				for ( yy_i = 0; yytoks[yy_i].t_val >= 0;
					yy_i++ )
				{
					if ( yytoks[yy_i].t_val == yychar )
						break;
				}
				printf( "%s\n", yytoks[yy_i].t_name );
			}
		}
#endif /* YYDEBUG */
		if ( ++yy_ps >= &yys[ YYMAXDEPTH ] )	/* room on stack? */
		{
			yyerror( "yacc stack overflow" );
			YYABORT;
		}
		*yy_ps = yy_state;
		*++yy_pv = yyval;

		/*
		** we have a new state - find out what to do
		*/
	yy_newstate:
		if ( ( yy_n = yypact[ yy_state ] ) <= YYFLAG )
			goto yydefault;		/* simple state */
#if YYDEBUG
		/*
		** if debugging, need to mark whether new token grabbed
		*/
		yytmp = yychar < 0;
#endif
		if ( ( yychar < 0 ) && ( ( yychar = yylex() ) < 0 ) )
			yychar = 0;		/* reached EOF */
#if YYDEBUG
		if ( yydebug && yytmp )
		{
			register int yy_i;

			printf( "Received token " );
			if ( yychar == 0 )
				printf( "end-of-file\n" );
			else if ( yychar < 0 )
				printf( "-none-\n" );
			else
			{
				for ( yy_i = 0; yytoks[yy_i].t_val >= 0;
					yy_i++ )
				{
					if ( yytoks[yy_i].t_val == yychar )
						break;
				}
				printf( "%s\n", yytoks[yy_i].t_name );
			}
		}
#endif /* YYDEBUG */
		if ( ( ( yy_n += yychar ) < 0 ) || ( yy_n >= YYLAST ) )
			goto yydefault;
		if ( yychk[ yy_n = yyact[ yy_n ] ] == yychar )	/*valid shift*/
		{
			yychar = -1;
			yyval = yylval;
			yy_state = yy_n;
			if ( yyerrflag > 0 )
				yyerrflag--;
			goto yy_stack;
		}

	yydefault:
		if ( ( yy_n = yydef[ yy_state ] ) == -2 )
		{
#if YYDEBUG
			yytmp = yychar < 0;
#endif
			if ( ( yychar < 0 ) && ( ( yychar = yylex() ) < 0 ) )
				yychar = 0;		/* reached EOF */
#if YYDEBUG
			if ( yydebug && yytmp )
			{
				register int yy_i;

				printf( "Received token " );
				if ( yychar == 0 )
					printf( "end-of-file\n" );
				else if ( yychar < 0 )
					printf( "-none-\n" );
				else
				{
					for ( yy_i = 0;
						yytoks[yy_i].t_val >= 0;
						yy_i++ )
					{
						if ( yytoks[yy_i].t_val
							== yychar )
						{
							break;
						}
					}
					printf( "%s\n", yytoks[yy_i].t_name );
				}
			}
#endif /* YYDEBUG */
			/*
			** look through exception table
			*/
			{
				register int *yyxi = yyexca;

				while ( ( *yyxi != -1 ) ||
					( yyxi[1] != yy_state ) )
				{
					yyxi += 2;
				}
				while ( ( *(yyxi += 2) >= 0 ) &&
					( *yyxi != yychar ) )
					;
				if ( ( yy_n = yyxi[1] ) < 0 )
					YYACCEPT;
			}
		}

		/*
		** check for syntax error
		*/
		if ( yy_n == 0 )	/* have an error */
		{
			/* no worry about speed here! */
			switch ( yyerrflag )
			{
			case 0:		/* new error */
				yyerror( "syntax error" );
				goto skip_init;
			yyerrlab:
				/*
				** get globals into registers.
				** we have a user generated syntax type error
				*/
				yy_pv = yypv;
				yy_ps = yyps;
				yy_state = yystate;
				yynerrs++;
			skip_init:
			case 1:
			case 2:		/* incompletely recovered error */
					/* try again... */
				yyerrflag = 3;
				/*
				** find state where "error" is a legal
				** shift action
				*/
				while ( yy_ps >= yys )
				{
					yy_n = yypact[ *yy_ps ] + YYERRCODE;
					if ( yy_n >= 0 && yy_n < YYLAST &&
						yychk[yyact[yy_n]] == YYERRCODE)					{
						/*
						** simulate shift of "error"
						*/
						yy_state = yyact[ yy_n ];
						goto yy_stack;
					}
					/*
					** current state has no shift on
					** "error", pop stack
					*/
#if YYDEBUG
#	define _POP_ "Error recovery pops state %d, uncovers state %d\n"
					if ( yydebug )
						printf( _POP_, *yy_ps,
							yy_ps[-1] );
#	undef _POP_
#endif
					yy_ps--;
					yy_pv--;
				}
				/*
				** there is no state on stack with "error" as
				** a valid shift.  give up.
				*/
				YYABORT;
			case 3:		/* no shift yet; eat a token */
#if YYDEBUG
				/*
				** if debugging, look up token in list of
				** pairs.  0 and negative shouldn't occur,
				** but since timing doesn't matter when
				** debugging, it doesn't hurt to leave the
				** tests here.
				*/
				if ( yydebug )
				{
					register int yy_i;

					printf( "Error recovery discards " );
					if ( yychar == 0 )
						printf( "token end-of-file\n" );
					else if ( yychar < 0 )
						printf( "token -none-\n" );
					else
					{
						for ( yy_i = 0;
							yytoks[yy_i].t_val >= 0;
							yy_i++ )
						{
							if ( yytoks[yy_i].t_val
								== yychar )
							{
								break;
							}
						}
						printf( "token %s\n",
							yytoks[yy_i].t_name );
					}
				}
#endif /* YYDEBUG */
				if ( yychar == 0 )	/* reached EOF. quit */
					YYABORT;
				yychar = -1;
				goto yy_newstate;
			}
		}/* end if ( yy_n == 0 ) */
		/*
		** reduction by production yy_n
		** put stack tops, etc. so things right after switch
		*/
#if YYDEBUG
		/*
		** if debugging, print the string that is the user's
		** specification of the reduction which is just about
		** to be done.
		*/
		if ( yydebug )
			printf( "Reduce by (%d) \"%s\"\n",
				yy_n, yyreds[ yy_n ] );
#endif
		yytmp = yy_n;			/* value to switch over */
		yypvt = yy_pv;			/* $vars top of value stack */
		/*
		** Look in goto table for next state
		** Sorry about using yy_state here as temporary
		** register variable, but why not, if it works...
		** If yyr2[ yy_n ] doesn't have the low order bit
		** set, then there is no action to be done for
		** this reduction.  So, no saving & unsaving of
		** registers done.  The only difference between the
		** code just after the if and the body of the if is
		** the goto yy_stack in the body.  This way the test
		** can be made before the choice of what to do is needed.
		*/
		{
			/* length of production doubled with extra bit */
			register int yy_len = yyr2[ yy_n ];

			if ( !( yy_len & 01 ) )
			{
				yy_len >>= 1;
				yyval = ( yy_pv -= yy_len )[1];	/* $$ = $1 */
				yy_state = yypgo[ yy_n = yyr1[ yy_n ] ] +
					*( yy_ps -= yy_len ) + 1;
				if ( yy_state >= YYLAST ||
					yychk[ yy_state =
					yyact[ yy_state ] ] != -yy_n )
				{
					yy_state = yyact[ yypgo[ yy_n ] ];
				}
				goto yy_stack;
			}
			yy_len >>= 1;
			yyval = ( yy_pv -= yy_len )[1];	/* $$ = $1 */
			yy_state = yypgo[ yy_n = yyr1[ yy_n ] ] +
				*( yy_ps -= yy_len ) + 1;
			if ( yy_state >= YYLAST ||
				yychk[ yy_state = yyact[ yy_state ] ] != -yy_n )
			{
				yy_state = yyact[ yypgo[ yy_n ] ];
			}
		}
					/* save until reenter driver code */
		yystate = yy_state;
		yyps = yy_ps;
		yypv = yy_pv;
	}
	/*
	** code supplied by user is placed in this switch
	*/
	switch( yytmp )
	{
		
case 7:
# line 42 "gram.y"
{
			  if (exprs[yypvt[-3].intval])
				exprs[yypvt[-3].intval] = new_bnode (OR, yypvt[-1].bnodeval, exprs[yypvt[-3].intval]);
			  else	exprs[yypvt[-3].intval] = yypvt[-1].bnodeval;
			} break;
case 12:
# line 58 "gram.y"
{ yyval.bnodeval = new_bnode (OR, yypvt[-2].bnodeval, yypvt[-0].bnodeval); } break;
case 13:
# line 60 "gram.y"
{ yyval.bnodeval = new_bnode (AND, yypvt[-2].bnodeval, yypvt[-0].bnodeval); } break;
case 14:
# line 62 "gram.y"
{ yyval.bnodeval = new_bnode (NOT, yypvt[-0].bnodeval, NIL_BNODE); } break;
case 15:
# line 64 "gram.y"
{ yyval.bnodeval = new_bnode (yypvt[-0].intval, NIL_BNODE, NIL_BNODE); } break;
case 16:
# line 66 "gram.y"
{ yyval.bnodeval = new_bnode (ZERO, NIL_BNODE, NIL_BNODE); } break;
case 17:
# line 68 "gram.y"
{ yyval.bnodeval = new_bnode (ZERO, NIL_BNODE, NIL_BNODE); } break;
case 18:
# line 70 "gram.y"
{ yyval.bnodeval = new_bnode (ONE, NIL_BNODE, NIL_BNODE); } break;
case 19:
# line 72 "gram.y"
{ yyval.bnodeval = new_bnode (ONE, NIL_BNODE, NIL_BNODE); } break;
case 20:
# line 74 "gram.y"
{ yyval.bnodeval = new_bnode (DONTCARE, NIL_BNODE, NIL_BNODE); } break;
case 21:
# line 76 "gram.y"
{ yyval.bnodeval = yypvt[-1].bnodeval; } break;
case 22:
# line 80 "gram.y"
{ yyval.intval = nt_output (yytext); } break;
case 23:
# line 84 "gram.y"
{ yyval.intval = nt_input (yytext); } break;
case 24:
# line 88 "gram.y"
{ set_planame (yytext); } break;
	}
	goto yystack;		/* reset registers in driver code */
}

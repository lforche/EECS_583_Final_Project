/*
 *
 *	Copyright (C) 1981, Regents of the University of California
 *
 *	All rights reserved
 *
 */
/*
 * setup process's standard input to read from a succession
 * of "cc -E" invocations, one for each source file.
 */

extern char *Argv[], *files[];
extern int Argc, nfiles;


int
preprocess()
{
	int p[2], i;

	if (0 > pipe (p))
		return (1);
	if (fork())
		/* redirect parent's standard input */
		return (
			0 > close (0) ||
			0 > dup (p[0]) ||
			0 > close (p[1]) ||
			0 > close (p[0])
		);

	/*
	 * You are now in the child process, who's job it is to 
	 * repeatedly fork/exec the C preprocessor.
	 * First redirect the child's standard output to the
	 * the pipe to the parent process.
	 */

	if (
		0 > close (1) ||
		0 > dup (p[1]) ||
		0 > close (p[0]) ||
		0 > close (p[1])
	)
		exit (1);

	/*
	 * Argv must be set up for cc invocatons as follows:
	 * Argv[0] = "cc" : C compiler
	 * Argv[1] = "-E" : option to invoke only C preprocessor
	 * Argv[2] through Argv[Argc-1] = -D, -I, -U options taken
	 *	from the command line by procargs.
	 * Argv[Argc] = one of the "nfiles" file names in "files"
	 *	taken from the command line by procargs.
	 * Argv[Argc+1] = (null) : marks end of argument list
	 */
/* /bin/cc does not exist on many machines and gcc is not compatible.
 * Use eqntott_cpp which is built by IMPACT release 2.33 specifically
 * to solve this porting problem -JCG 7/99 
 */
#if defined(IMPACT_FIX)
	Argv[0] = "cat";
	Argv[1] = "";
#else
	Argv[0] = "/bin/cc";
	Argv[1] = "-E";
#endif
	Argv[Argc+1] = (char *) 0;

	for (i = 0; i < nfiles; i++) {
                extern char *malloc();
                char *cmd;
                int j, s;

		Argv[Argc] = files[i];

                for (j=0, s=0; j < Argc+1; j++)
                        s += strlen(Argv[j]);

                cmd = malloc(s+50);     /* plenty for fudge */
                cmd[0] = 0;
                for (j=0; j < Argc+1; j++) {
                        strcat(cmd, " ");
                        strcat(cmd, Argv[j]);
                }
                system(cmd);
                free(cmd);
	}
	exit (0);
}

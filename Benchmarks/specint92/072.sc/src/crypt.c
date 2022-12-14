/*
 * Encryption utilites
 * Bradley Williams	
 * {allegra,ihnp4,uiucdcs,ctvax}!convex!williams
 * $Revision: 1.2 $
 */

#include <stdio.h>
#include "curses.h"

#if defined(BSD42) || defined(BSD43)
#include <sys/file.h>
#else
#include <fcntl.h>
#endif

#undef MIN 
#undef MAX
/* 
   Undefined MIN and MAX the right definitions of which are 
   in sc.h to avoid "redefined messages as requested by 
   Data General.
 
   - Kaivalya and Prasad, SMCC, 08/07/91
 
*/

#include "sc.h"

char        *strcpy();

#ifdef SYSV3
void exit();
#endif

int         Crypt = 0;

creadfile (save, eraseflg)
char *save;
int  eraseflg;
{
    register FILE *f;
    int pipefd[2];
    int fildes;
    int pid;

    if (eraseflg && strcmp(save, curfile) && modcheck(" first")) return;

    fildes = open (save, O_RDONLY, 0);
    if (fildes < 0)
    {
	error ("Can't read file \"%s\"", save);
	return;
    }

    if (eraseflg) erasedb ();

    if (pipe(pipefd) < 0) {
	error("Can't make pipe to child");
	return;
    }

    deraw();
    if ((pid=fork()) == 0)			  /* if child  */
    {
	(void) close (0);		  /* close stdin */
	(void) close (1);		  /* close stdout */
	(void) close (pipefd[0]);	  /* close pipe input */
	(void) dup (fildes);		  /* standard in from file */
	(void) dup (pipefd[1]);		  /* connect to pipe */
	(void) fprintf (stderr, " ");
	(void) execl ("/bin/sh", "sh", "-c", "crypt", 0);
	exit (-127);
    }
    else				  /* else parent */
    {
	(void) close (fildes);
	(void) close (pipefd[1]);	  /* close pipe output */
	f = fdopen (pipefd[0], "r");
	if (f == 0)
	{
	    (void) kill (pid, -9);
	    error ("Can't fdopen file \"%s\"", save);
	    (void) close (pipefd[0]);
	    return;
	}
    }

    loading++;
    while (fgets(line,sizeof line,f)) {
	linelim = 0;
	if (line[0] != '#') (void) yyparse ();
    }
    --loading;
    (void) fclose (f);
    (void) close (pipefd[0]);
    while (pid != wait(&fildes)) /**/;
    goraw();
    linelim = -1;
    modflg++;
    if (eraseflg) {
	(void) strcpy (curfile, save);
	modflg = 0;
    }
    EvalAll();
}

cwritefile (fname, r0, c0, rn, cn)
char *fname;
int r0, c0, rn, cn;
{
    register FILE *f;
    int pipefd[2];
    int fildes;
    int pid;
    char save[1024];
    char *fn;


    if (*fname == 0) fname = &curfile[0];

    fn = fname;
    while (*fn && (*fn == ' '))  /* Skip leading blanks */
	fn++;

    if ( *fn == '|' ) {
	error ("Can't have encrypted pipe");
	return(-1);
	}

    (void) strcpy(save,fname);

    fildes = open (save, O_WRONLY|O_CREAT, 0600);
    if (fildes < 0)
    {
	error ("Can't create file \"%s\"", save);
	return(-1);
    }

    if (pipe (pipefd) < 0) {
	error ("Can't make pipe to child\n");
	return(-1);
    }

    deraw();
    if ((pid=fork()) == 0)			  /* if child  */
    {
	(void) close (0);			  /* close stdin */
	(void) close (1);			  /* close stdout */
	(void) close (pipefd[1]);		  /* close pipe output */
	(void) dup (pipefd[0]);			  /* connect to pipe input */
	(void) dup (fildes);			  /* standard out to file */
	(void) fprintf (stderr, " ");
	(void) execl ("/bin/sh", "sh", "-c", "crypt", 0);
	exit (-127);
    }
    else				  /* else parent */
    {
	(void) close (fildes);
	(void) close (pipefd[0]);		  /* close pipe input */
	f = fdopen (pipefd[1], "w");
	if (f == 0)
	{
	    (void) kill (pid, -9);
	    error ("Can't fdopen file \"%s\"", save);
	    (void) close (pipefd[1]);
	    return(-1);
	}
    }

    write_fd(f, r0, c0, rn, cn);

    (void) fclose (f);
    (void) close (pipefd[1]);
    while (pid != wait(&fildes)) /**/;
    (void) strcpy(curfile,save);

    modflg = 0;
    error ("File \"%s\" written", curfile);
    goraw();
    return(0);
}


#include "curses.h"

#ifdef __ANSI__
int wclrtobot(WINDOW *x) { }
int noecho(void) { }
int echo(void) { }
int reset_shell_mode(void) { }
int endwin(void) { }
int reset_prog_mode() { }

int COLS = 24;
int LINES = 80;
int wclrtoeol(WINDOW *x) { }
int waddnstr(WINDOW *x, char *y, int z) { }

int clearok(WINDOW *x , int y) { }
int wclear(WINDOW *x) { }
int printw(char *x, ...) { }
int nonl(void) { }
int nl(void) { }
int noraw(void) { }
int raw(void) { }
int wrefresh(WINDOW *x) { }
int waddch(WINDOW *x, chtype y) { }
WINDOW  *stdscr;
int wmove(WINDOW *x, int y, int z) { }
WINDOW  *initscr() { }
chtype winch(WINDOW *x) { }
int wstandout(WINDOW *x) { }
int wstandend(WINDOW *x) { }
int waddstr(WINDOW *x, char *y) { }

#else

int wclrtobot() { }
int noecho() { }
int echo() { }
int reset_shell_mode() { }
int endwin() { }
int reset_prog_mode() { }

int COLS = 24;
int LINES = 80;
int wclrtoeol() { }
int waddnstr() { }

int clearok() { }
int wclear() { }
int printw() { }
int nonl() { }
int nl() { }
int noraw() { }
int raw() { }
int wrefresh() { }
int waddch() { }
WINDOW  *stdscr;
int wmove() { }
WINDOW  *initscr() { }
chtype winch() { }
int wstandout() { }
int wstandend() { }
int waddstr() { }
int resetterm() { }
int fixterm() { }

#endif

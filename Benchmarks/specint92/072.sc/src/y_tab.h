
typedef union  {
    int ival;
    double fval;
    struct ent_ptr ent;
    struct enode *enode;
    char *sval;
    struct range_s rval;
} YYSTYPE;
extern YYSTYPE yylval;
# define STRING 257
# define NUMBER 258
# define FNUMBER 259
# define RANGE 260
# define VAR 261
# define WORD 262
# define COL 263
# define S_FORMAT 264
# define S_LABEL 265
# define S_LEFTSTRING 266
# define S_RIGHTSTRING 267
# define S_GET 268
# define S_PUT 269
# define S_MERGE 270
# define S_LET 271
# define S_WRITE 272
# define S_TBL 273
# define S_COPY 274
# define S_SHOW 275
# define S_ERASE 276
# define S_FILL 277
# define S_GOTO 278
# define S_DEFINE 279
# define S_UNDEFINE 280
# define S_VALUE 281
# define S_MDIR 282
# define S_HIDE 283
# define S_SET 284
# define K_FIXED 285
# define K_SUM 286
# define K_PROD 287
# define K_AVG 288
# define K_STDDEV 289
# define K_ACOS 290
# define K_ASIN 291
# define K_ATAN 292
# define K_ATAN2 293
# define K_CEIL 294
# define K_COS 295
# define K_EXP 296
# define K_FABS 297
# define K_FLOOR 298
# define K_HYPOT 299
# define K_LN 300
# define K_LOG 301
# define K_PI 302
# define K_POW 303
# define K_SIN 304
# define K_SQRT 305
# define K_TAN 306
# define K_DTR 307
# define K_RTD 308
# define K_MAX 309
# define K_MIN 310
# define K_RND 311
# define K_PV 312
# define K_FV 313
# define K_PMT 314
# define K_HOUR 315
# define K_MINUTE 316
# define K_SECOND 317
# define K_MONTH 318
# define K_DAY 319
# define K_YEAR 320
# define K_NOW 321
# define K_DATE 322
# define K_FMT 323
# define K_SUBSTR 324
# define K_STON 325
# define K_EQS 326
# define K_EXT 327
# define K_NVAL 328
# define K_SVAL 329
# define K_LOOKUP 330
# define K_INDEX 331
# define K_STINDEX 332
# define K_AUTO 333
# define K_AUTOCALC 334
# define K_BYROWS 335
# define K_BYCOLS 336
# define K_BYGRAPH 337
# define K_ITERATIONS 338
# define K_NUMERIC 339
# define K_PRESCALE 340
# define K_EXTFUN 341
# define K_CELLCUR 342
# define K_TOPROW 343
# define K_TBLSTYLE 344
# define K_TBL 345
# define K_LATEX 346
# define K_TEX 347

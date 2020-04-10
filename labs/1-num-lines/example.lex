%{
	int num_lines = 0;
	int num_words = 0;
	int num_caps_words = 0;
	int found = 0;
	char *word = "lala";
%}

UPPER_LETTER [A-Z]
LOW_LETTER	[a-z]
DIGIT	[0-9]
DASH	-
WORD	({UPPER_LETTER}|{LOW_LETTER}|{DIGIT}|{DASH})*
/* not call yywrap() at the end-of-file */
%option noyywrap 

%%
{UPPER_LETTER}{WORD} num_caps_words++; num_words++;
{WORD} {
	if (strcmp(yytext, word) == 0)
		found++;

	num_words++;
}
\n	num_lines++;

%%
int main(void) {
	yylex();
	printf("# of lines = %d\n", num_lines);
	printf("# of words = %d\n", num_words);
	printf("# of caps words = %d\n", num_caps_words);
	printf("# of found words == lala = %d\n", found);
}

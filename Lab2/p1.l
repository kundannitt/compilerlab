%{
	int if_count = 0;
	int else_count = 0;
	int else_if_count=0;
%}

IF      "if"
ELSE    "else"
ELSEIF  "else if"
LPAREN  "("
RPAREN  ")"
LBRACE  "{"
RBRACE  "}"
SEMI    ";"

%%
{IF}    { if_count++; }
{ELSE}  { else_count++; }
{ELSEIF} {else_if_count++;}
{LPAREN}    { printf("("); }
{RPAREN}    { printf(")"); }
{LBRACE}    { printf("{\n"); }
{RBRACE}    { printf("}\n"); }
{SEMI}  { printf(";\n"); }
.       { /* ignore all other characters */ }
%%

int main()
{
    FILE *file;
    file=fopen("input1.c","r");

    if(!file)
    {
        printf("could not open the file");
        exit(0);
    }
    yyin=file;

    yylex();
    printf("if statements: %d\n", if_count);
    printf("else statements: %d\n", else_count);
    printf("else if statements: %d\n", else_if_count);
    return 0;
}

int yywrap()
{
    return(1);
}

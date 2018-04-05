
%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
void yyerror(char *);

#include "y.tab.h"


%}


%%

[\ ] {
	//printf("ESSA BARRA RIDICULA\n");
	return BARRA;
	}

[ " ] {
	return ASPAS;
	}

[ \[ ] {
	//printf("Achou ']'\n");
	return COLCHETE_E;
	}

[ \] ] {
	//printf("Achou '['\n");
	return COLCHETE_D;
	}

[,] {
	//printf ("Achou ','\n");
	return VIRGULA;
	}


[A-Z]+ {
	//printf ("Achou uma palavra\n");
	return PALAVRA;
	}

[0-9]+ {
	//printf ("Achou um numero\n");
        yylval = atoi(yytext);
	return NUMERO;
	}

\n   {
	//printf ("Achou um EOL\n");
        return EOL;
       }

[ \t]+ ;

.     {yyerror("Token nao reconhecido!\n");}

%%

int yywrap() {
  return 1;
}

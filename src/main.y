%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *c);
int yylex(void);
int erro = 1; //variavel para saber se ha erro

%}

%token PALAVRA NUMERO COLCHETE_E COLCHETE_D VIRGULA ASPAS BARRA EOL
%left COLCHETE_E COLCHETE_D
%left ASPAS
%left VIRGULA
%left BARRA

%%

PROGRAMA:
        PROGRAMA EXPRESSAO EOL {
		erro = 0; //se passou por aqui, eh porque nao ha erro
		return 0;

	}
        |
        ;


EXPRESSAO:
	NUMERO {
		$$ = $1;
          }

	| PALAVRA {
		$$ = $1;
	}

	| COLCHETE_E COLCHETE_D {
	}

	| ASPAS EXPRESSAO ASPAS{
	}


	| EXPRESSAO VIRGULA BARRA EXPRESSAO {

	}


	| COLCHETE_E EXPRESSAO COLCHETE_D { 
	}

%%

void yyerror(char *s) {
}

int main() {

	yyparse();

	if (erro == 1){
		printf ("ERRO\n");
	}else{
		printf ("OK\n");
	}
	return 0;

}

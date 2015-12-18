%{
int yystopparser=0;
%}

%token VOID MAIN NOMBRECAMPO ENTERO DECIMAL BOLEANO CADENA T_ENTERO T_DECIMAL T_BOLEANO T_CADENA ASIGNADOR 
SUMA RESTA MULTIPLICACION DIVISION AUMENTAR DISMINUIR SI MAYOR MENOR IGUAL MAYORIGUAL MENORIGUAL NOIGUAL
NO SINO PARA MIENTRAS


%start programa

%%

programa		: principal funciones | principal;

principal		: VOID MAIN '(' VOID ')' '{' lineascodigos '}';

lineascodigos		: lineacodigo |;

lineacodigo		: lineacodigo linea | linea;

linea			: invocarmetodo ';' | crearvariable ';' | cambiarvalor ';' | buclecondicion;

invocarmetodo		: NOMBRECAMPO '(' parametrosenvio ')';

parametrosenvio		: parenvio |;

parenvio		: parenvio ',' penvio | penvio;

penvio			: valor | NOMBRECAMPO;

valor			: ENTERO | DECIMAL | BOLEANO | CADENA;

crearvariable		: tipodato NOMBRECAMPO | tipodato NOMBRECAMPO asignarvalor;

tipodato		: T_ENTERO | T_DECIMAL | T_BOLEANO | T_CADENA;

asignarvalor		: ASIGNADOR operasignacion | ASIGNADOR valor | ASIGNADOR NOMBRECAMPO;

operasignacion		: aritmetica | invocarmetodo | incredismivariable;

aritmetica		: oprcomun | oprcomun oprcomplemento;

oprcomun		: valor tipoopr valor | valor tipoopr NOMBRECAMPO | NOMBRECAMPO tipoopr valor | NOMBRECAMPO tipoopr NOMBRECAMPO;

tipoopr			: SUMA | RESTA | MULTIPLICACION | DIVISION;

oprcomplemento		: oprcomplemento oprcom | oprcom;

oprcom			: tipoopr valor | tipoopr NOMBRECAMPO;

incredismivariable	: NOMBRECAMPO indis;

indis			: AUMENTAR | DISMINUIR;

cambiarvalor		: NOMBRECAMPO ASIGNADOR |cambvalor;

cambvalor		:valor | operasignacion | NOMBRECAMPO;

buclecondicion		: condicionif | buclefor | buclewhile;

condicionif		: condicionsi | condicionsi condicionno | condicionsi condicionsino condicionno;

condicionsi		: SI '(' condicion ')' '{' lineascodigos '}';

condicion		: valor condicional valor | valor condicional NOMBRECAMPO | NOMBRECAMPO condicional valor | NOMBRECAMPO condicional NOMBRECAMPO;

condicional		: MAYOR | MENOR | IGUAL | MAYORIGUAL | MENORIGUAL | NOIGUAL;

condicionno		: NO '{' lineascodigos '}';

condicionessino		: condicionessino condicionsino | condicionsino;

condicionsino		: SINO '('condicion ')' '{' lineascodigos '}';

buclefor		: PARA '(' iniciarfor ';' condicion ';' incredismivariable ')' '{' lineascodigos '}';

iniciarfor              : tipodato NOMBRECAMPO asignarvalor;

buclewhile		: MIENTRAS '(' condicion ')' '{' lineascodigos '}';

funciones		: funciones funcion | funcion;

funcion			: tiporetorno NOMBRECAMPO '(' parametrosin ')' '{' lineascodigos '}';

tiporetorno		: tipodato | VOID;

parametrosin		: parametros |;

parametros              : parametros ',' parametro | parametro;

parametro               : tipodato NOMBRECAMPO;
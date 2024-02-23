package codigo;
import static codigo.Tokens.*;

%%

%class Lexer
%unicode
%public
%type Tokens

%%

// Reglas léxicas

// Reconoce el símbolo de suma (+) y retorna el token SUMA.
[+]{1}         { return SUMA; }

// Reconoce tanto el guion normal (-) como el en dash (–, \u2013) y retorna el token RESTA.
// Esto asegura que el lexer pueda manejar la entrada independientemente de si se utilizó un guion normal o un en dash.
"-" | "\u2013" { return RESTA; }

// Reconoce el símbolo de multiplicación (*) y retorna el token MULTIPLICACION.
[*]{1}         { return MULTIPLICACION; }

// Reconoce el símbolo de división (/) y retorna el token DIVISION.
[/]{1}         { return DIVISION; }

// Reconoce el símbolo de igualdad (=) y retorna el token IGUAL.
"="            { return IGUAL; }

// Reconoce cualquier secuencia de una o más letras (mayúsculas o minúsculas) como una VARIABLE.
// Esto permite identificar nombres de variables en el código.
[a-zA-Z]+      { return VARIABLE; }

// Reconoce una secuencia de uno o más dígitos como un número entero (NUMERO).
[0-9]+         { return NUMERO; }

// Reconoce números reales, que consisten en una secuencia de dígitos, seguida de un punto decimal,
// y otra secuencia de dígitos. Retorna el token REAL.
[0-9]+"."[0-9]+ { return REAL; }

// Ignora los espacios en blanco, incluidos espacios, tabulaciones, nuevas líneas y retornos de carro.
// No retorna ningún token para estos caracteres, simplemente los salta.
[ \t\r\n\f]+   { /* Ignorar espacios en blanco */ }

// Define patrones para palabras reservadas específicas ("if", "else") y retorna el token RESERVADAS.
// Puedes añadir aquí más palabras reservadas según sea necesario para tu lenguaje.
"if"           { return RESERVADAS; }
"else"         { return RESERVADAS; }

// Captura cualquier otro carácter que no coincida con las reglas anteriores y retorna el token ERROR.
// Esto es útil para identificar caracteres inesperados o no permitidos en el análisis.
.              { return ERROR; }

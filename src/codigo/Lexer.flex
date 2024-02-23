package codigo;
import static codigo.Tokens.*;

%%

%class Lexer
%unicode
%public
%type Tokens

%%

// Reglas léxicas
[+]{1}         { return SUMA; }
[-]{1}         { return RESTA; }
[*]{1}         { return MULTIPLICACION; }
[/]{1}         { return DIVISION; }
"="            { return IGUAL; }
[a-zA-Z]+      { return VARIABLE; } // Las variables pueden ser de más de un carácter
[0-9]+         { return NUMERO; } // Coincide con números enteros
[0-9]+"."[0-9]+ { return REAL; } // Coincide con números reales
[ \t\r\n\f]+   { /* Ignorar espacios en blanco */ }

// Lugar para las palabras reservadas, necesitas definirlas según tus necesidades específicas
"if"           { return RESERVADAS; }
"else"         { return RESERVADAS; }
// Añade otras palabras reservadas según sea necesario

.              { return ERROR; } // Coincide con cualquier carácter no coincidente con las reglas anteriores



import java_cup.runtime.*;
import java.util.ArrayList;

%%

%public
%class Lexer
%unicode
%caseless
%line
%column
%cup

SELECT                 =   "SELECCIONAR"
REPORT                 =   "REPORTE"
FILTER                 =   "FILTRAR"
BY                     =   "POR"

//regex trivias [idtrivia1, idtrivia2, idtrivia3]



%{
        StringBuffer stringBuffer = new StringBuffer();
        ArrayList<Error> errors = new ArrayList<Error>();

        private Symbol symbol(int type){
            return new Symbol(type, yyline+1, yycolumn+1);
        }

        private Symbol symbol(int type, Object value){
            return new Symbol(type, yyline+1, yycolumn+1, value);
        }

        public ArrayList<ErrorL> getErrorsLexicos(){
            return this.errors;
        }
%}

%eofval{
    return new Symbol(ParserSym.EOF);
%eofval}
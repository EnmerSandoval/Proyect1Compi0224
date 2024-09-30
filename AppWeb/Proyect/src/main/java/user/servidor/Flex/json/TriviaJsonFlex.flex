package user.servidor.Flex.json;

import java_cup.runtime.*;
import java.util.ArrayList;
import user.servidor.Errors.ErrorL;
import user.servidor.Cup.json.TriviaJsonSym;

%%

%public
%class TriviaJsonFlex
%unicode
%caseless
%line
%column
%cup

// Instructions for JSON
CORCHETA            = "["
CORCHETC            = "]"
KEYA                = "{"
KEYC                = "}"
COLON               = ":"
COMMA               = ","

// Reserve words
ID                  = "\"ID\""
TIME                = "\"TIME\""
NAME                = "\"NAME\""
THEME               = "\"THEME\""
DATE                = "\"DATE\""
USER                = "\"USER\""
COMPONENTS          = "\"COMPONENTS\""
TXT_VISIBLE         = "\"TXT_VISIBLE\""
RESPONSE            = "\"RESPONSE\""
CLASS               = "\"CLASS\""
ROWS                = "\"ROWS\""
COLS                = "\"COLS\""

// Regex patterns
WHITESPCS           = ([\s\t\r\n]+)
TEXT                = "\"([^\"\n]|\\.)*\""
DATECREATION        = ([\"”“]([0-9]{4}-[0-9]{2}-[0-9]{2})[\"”“])

%{
    StringBuffer stringBuffer = new StringBuffer();
    ArrayList<ErrorL> errors = new ArrayList<ErrorL>();

    private Symbol symbol(int type){
        return new Symbol(type, yyline + 1, yycolumn + 1);
    }

    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline + 1, yycolumn + 1, value);
    }

    public ArrayList<ErrorL> getErrorsLexicos(){
        return this.errors;
    }

%}

%eofval{
    return new Symbol(TriviaJsonSym.EOF);
%eofval}

%%

{CORCHETA}          { return symbol(TriviaJsonSym.CORCHETEA, yytext()); }
{CORCHETC}          { return symbol(TriviaJsonSym.CORCHETEC, yytext()); }
{KEYA}              { return symbol(TriviaJsonSym.KEYA, yytext()); }
{KEYC}              { return symbol(TriviaJsonSym.KEYC, yytext()); }
{COLON}             { return symbol(TriviaJsonSym.COLON, yytext()); }
{COMMA}             { return symbol(TriviaJsonSym.COMMA, yytext()); }
{ID}                { return symbol(TriviaJsonSym.ID, yytext()); }
{TIME}              { return symbol(TriviaJsonSym.TIME, yytext()); }
{NAME}              { return symbol(TriviaJsonSym.NAME, yytext()); }
{THEME}             { return symbol(TriviaJsonSym.THEME, yytext()); }
{DATE}              { return symbol(TriviaJsonSym.DATE, yytext()); }
{USER}              { return symbol(TriviaJsonSym.USER, yytext()); }
{COMPONENTS}        { return symbol(TriviaJsonSym.COMPONENTS, yytext()); }
{TXT_VISIBLE}       { return symbol(TriviaJsonSym.TXT_VISIBLE, yytext()); }
{RESPONSE}          { return symbol(TriviaJsonSym.RESPONSE, yytext()); }
{CLASS}             { return symbol(TriviaJsonSym.CLASS, yytext()); }
{ROWS}              { return symbol(TriviaJsonSym.ROWS, yytext()); }
{COLS}              { return symbol(TriviaJsonSym.COLS, yytext()); }
{DATECREATION}      { return symbol(TriviaJsonSym.DATECREATION, yytext()); }
{TEXT}              { return symbol(TriviaJsonSym.TEXT, yytext()); }
{WHITESPCS}         { /* Ignore whitespace */ }

[^]                 {errors.add(new ErrorL(yytext(), yyline, yycolumn, "Error Lexico", "No coincide este caracter"));}

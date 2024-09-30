package user.servidor.Flex.json;

import java_cup.runtime.*;
import java.util.ArrayList;
import user.servidor.Errors.ErrorL;
import user.servidor.Cup.json.UserJsonSym;

%%

%public
%class UserJsonFlex
%unicode
%caseless
%line
%column
%cup

//Instructions for Json
CORCHETA            = "["
CORCHETC            = "]"
KEYA                = "{"
KEYC                = "}"
COLON               = ":"
COMMA               = ","

//RESERVE WORDS
USER              = "\"USUARIO\""
PASSWORD          = "\"PASSWORD\""
INSTITUTION       = "\"INSTITUCION\""
NAME              = "\"NOMBRE\""
DATE              = "\"FECHA_CREACION\""

WHITESPCS           = ([\s\t\r\n]+)
DIGIT               = [0-9]*
NUMBERVERSION       = [\"”“]{DIGIT}+(\.{DIGIT}+)?[\"”“]
LETTER              = [a-zA-Z]
TEXT                = "\""([^\"\n])([^\"\n])+"\"" | "'"([^'\n])([^'\n])+"'"
DATECREATION        = ([\"”“]([0-9]{4}-[0-9]{2}-[0-9]{2})[\"”“])

%{
    StringBuffer stringBuffer = new StringBuffer();
    ArrayList<ErrorL> errors = new ArrayList<ErrorL>();

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
    return new Symbol(UserJsonSym.EOF);
%eofval}


%%

{CORCHETA}          {return new Symbol(UserJsonSym.CORCHETEA, yycolumn, yyline, yytext());}
{CORCHETC}          {return new Symbol(UserJsonSym.CORCHETEC, yycolumn, yyline, yytext());}
{KEYA}              {return new Symbol(UserJsonSym.KEYA, yycolumn, yyline, yytext());}
{KEYC}              {return new Symbol(UserJsonSym.KEYC, yycolumn, yyline, yytext());}
{COLON}             {return new Symbol(UserJsonSym.COLON, yycolumn, yyline, yytext());}
{COMMA}             {return new Symbol(UserJsonSym.COMMA, yycolumn, yyline, yytext());}
{USER}              {return new Symbol(UserJsonSym.USER, yycolumn, yyline, yytext());}
{PASSWORD}          {return new Symbol(UserJsonSym.PASSWORD, yycolumn, yyline, yytext());}
{INSTITUTION}       {return new Symbol(UserJsonSym.INSTITUTION, yycolumn, yyline, yytext());}
{NAME}              {return new Symbol(UserJsonSym.NAME, yycolumn, yyline, yytext());}
{DATE}              {return new Symbol(UserJsonSym.DATE, yycolumn, yyline, yytext());}
{DATECREATION}      {return new Symbol(UserJsonSym.DATECREATION, yycolumn, yyline, yytext());}
{TEXT}              {return new Symbol(UserJsonSym.TEXT, yycolumn, yyline, yytext());}
{WHITESPCS}         {/*IGNORE*/}

[^]                 {errors.add(new ErrorL(yytext(), yyline, yycolumn, "Error Lexico", "No coincide este caracter"));}
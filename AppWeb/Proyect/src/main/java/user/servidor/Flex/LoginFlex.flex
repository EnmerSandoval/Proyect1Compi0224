package user.servidor.Flex;

import java_cup.runtime.*;
import java.util.ArrayList;
import user.servidor.Errors.ErrorL;
import user.servidor.Cup.LoginSym;

%%

%public
%class LoginFlex
%unicode
%caseless
%line
%column
%cup

//Instructions
//Simbols
EQUALS              =       "="
GREATERT            =       ">"
LESST               =       "<"
KEYA                =       "{"
KEYC                =       "}"
BRACKETA            =       "["
BRACKETC            =       "]"
COLON               =       ":"
COMMA               =       ","

//Simbols INIT
OPENXS              =       "<?"
OPENREQ             =       "<!"
ENDXS               =       "?>"
ENDREQ              =       "!>"
//---------------WORDS---------------
XSON                =      "xson"
VERSION             =       "version"
//Make request
INREQUEST           =       "realizar_solicitud"
EDREQUEST           =       "fin_solicitud_realizada"

//Register user
USERDATA            =       "\"DATOS_USUARIO\""
USER                =       "\"USUARIO\""
PASSWORD            =       "\"PASSWORD\""
//Modify user
LOGINUSER           =       "\"LOGIN_USUARIO\""
//REGEX
WHITESPCS           = ([\s\t\r\n]+)
DIGIT               = [0-9]*
NUMBERVERSION       = [\"”“]{DIGIT}+(\.{DIGIT}+)? ({LETTER})[\"”“]
LETTER              = ([a-z]|[A-Z])+
TEXT                = {NUMBERVERSION} | ([\"”“]({LETTER}|_|-|\$)+({LETTER}|{DIGIT}|_)*[\"”“])


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
    return new Symbol(LoginSym.EOF);
%eofval}

%%

{OPENREQ}               {return new Symbol(LoginSym.OPENREQ, yycolumn, yyline, yytext());}
{OPENXS}                {return new Symbol(LoginSym.OPENXS, yycolumn, yyline, yytext());}
{XSON}                  {return new Symbol(LoginSym.XSON, yycolumn, yyline, yytext());}
{VERSION}               {return new Symbol(LoginSym.VERSION, yycolumn, yyline, yytext());}
{INREQUEST}             {return new Symbol(LoginSym.INREQUEST, yycolumn, yyline, yytext());}
{EDREQUEST}             {return new Symbol(LoginSym.EDREQUEST, yycolumn, yyline, yytext());}
{ENDXS}                 {return new Symbol(LoginSym.ENDXS, yycolumn, yyline, yytext());}
{ENDREQ}                {return new Symbol(LoginSym.ENDREQ, yycolumn, yyline, yytext());}
{COLON}                 {return new Symbol(LoginSym.COLON, yycolumn, yyline, yytext());}
{USERDATA}              {return new Symbol(LoginSym.USERDATA, yycolumn, yyline, yytext());}
{USER}                  {return new Symbol(LoginSym.USER, yycolumn, yyline, yytext());}
{PASSWORD}              {return new Symbol(LoginSym.PASSWORD, yycolumn, yyline, yytext());}
{LOGINUSER}             {return new Symbol(LoginSym.LOGINUSER, yycolumn, yyline, yytext());}
{EQUALS}                {return new Symbol(LoginSym.EQUALS, yycolumn, yyline, yytext());}
{GREATERT}              {return new Symbol(LoginSym.GREATERT, yycolumn, yyline, yytext());}
{LESST}                 {return new Symbol(LoginSym.LESST, yycolumn, yyline, yytext());}
{KEYA}                  {return new Symbol(LoginSym.KEYA, yycolumn, yyline, yytext());}
{KEYC}                  {return new Symbol(LoginSym.KEYC, yycolumn, yyline, yytext());}
{BRACKETA}              {return new Symbol(LoginSym.BRACKETA, yycolumn, yyline, yytext());}
{BRACKETC}              {return new Symbol(LoginSym.BRACKETC, yycolumn, yyline, yytext());}
{COMMA}                 {return new Symbol(LoginSym.COMMA, yycolumn, yyline, yytext());}
{TEXT}                  {return new Symbol(LoginSym.TEXT, yyline, yycolumn, yytext());}
{WHITESPCS}             {/*ignore*/}

[^]                     {errors.add(new ErrorL(yytext(), yyline, yycolumn, "Error Lexico", "No coincide este caracter"));}
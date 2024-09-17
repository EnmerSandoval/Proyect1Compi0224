package org.proyect1.Flex;

import java_cup.runtime.*;
import java.util.ArrayList;
import user.servidor.Errors.ErrorL;

%%

%public
%class UserFlex
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
COlON               =       ":"
COMMA               =       ","

//Simbols INIT
OPENXS              =       "<?"
OPENREQ             =       "<!"
ENDXS               =       "?>"
ENDREQ              =       "!>"
//---------------WORDS---------------
XSON                =       "xson"
VERSION             =       "version"
//Make request
INREQUEST           =       "realizar_solicitud"
EDREQUEST           =       "fin_solicitud_realizada"
//Make requests
INITREQUESTS        =       "realizar_solicitudes"
ENDREQUESTS         =       "fin_solicitudes_realizada"
//Register user
NEWUSER             =       "\"USUARIO_NUEVO\""
USERDATA            =       "\"DATOS_USUARIO\""
USER                =       "\"USUARIO\""
PASSWORD            =       "\"PASSWORD\""
NAME                =       "\"NOMBRE\""
INSTITUTION         =       "\"INSTITUCION\""
DATE                =       "\"FECHA_CREACION\""
DATEEDIT            =       "\"FECHA_MODIFICACION\""
//Modify user
EDITUSER            =       "\"MODIFICAR_USUARIO\""
OLDUSER             =       "\"USUARIO_ANTIGUO\""
NEWPASSWORD         =       "\"NUEVO_PASSWORD\""
//Delete user for the system
DELETEUSER          =       "\"ELIMINAR_USUARIO\""
//REGEX
WHITESPCS       = ([\s\t\r\n]+)
NUMBERVERSION       = [\"”“]{DIGIT}+(\.{DIGIT}+)?[\"”“]
DIGIT           = [0-9]
NUMBER          = ([0-9])+
LETTER          = [a-zA-Z]
TEXT            = {NUMBERVERSION} | ([\"”“]({LETTER}|_|-|\$)+({LETTER}|{DIGIT}|_)*[\"”“])
DATECREATION    = \"([0-9]{4}-[0-9]{2}-[0-9]{2})\"


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
    return new Symbol(LoginSym.EOF);
%eofval}

%%

{OPENXS}                {return new Symbol(LoginSym.OPENXS, yycolumn, yyline, yytext());}
{OPENREQ}               {return new Symbol(LoginSym.OPENREQ, yycolumn, yyline, yytext());}
{XSON}                  {return new Symbol(LoginSym.XSON, yycolumn, yyline, yytext());}
{VERSION}               {return new Symbol(LoginSym.VERSION, yycolumn, yyline, yytext());}
{INREQUEST}             {return new Symbol(LoginSym.INREQUEST, yycolumn, yyline, yytext());}
{EDREQUEST}             {return new Symbol(LoginSym.EDREQUEST, yycolumn, yyline, yytext());}
{INITREQUESTS}          {return new Symbol(LoginSym.INITREQUEST, yycolumn, yyline, yytext());}
{ENDREQUESTS}           {return new Symbol(LoginSym.ENDREQUESTS, yycolumn, yyline, yytext());}
{NEWUSER}               {return new Symbol(LoginSym.NEWUSER, yycolumn, yyline, yytext());}
{USERDATA}              {return new Symbol(LoginSym.USERDATA, yycolumn, yyline, yytext());}
{USER}                  {return new Symbol(LoginSym.USER, yycolumn, yyline, yytext());}
{PASSWORD}              {return new Symbol(LoginSym.PASSWORD, yycolumn, yyline, yytext());}
{NAME}                  {return new Symbol(LoginSym.NAME, yycolumn, yyline, yytext());}
{INSTITUTION}           {return new Symbol(LoginSym.INSTITUTION, yycolumn, yyline, yytext());}
{DATE}                  {return new Symbol(LoginSym.DATE, yycolumn, yyline, yytext());}
{DATEEDIT}              {return new Symbol(LoginSym.DATEEDIT, yycolumn, yyline, yytext());}
{EDITUSER}              {return new Symbol(LoginSym.EDITUSER, yycolumn, yyline, yytext());}
{OLDUSER}               {return new Symbol(LoginSym.OLDUSER, yycolumn, yyline, yytext());}
{NEWPASSWORD}           {return new Symbol(LoginSym.NEWPASSWORD, yycolumn, yyline, yytext());}
{DELETEUSER}            {return new Symbol(LoginSym.DELETEUSER, yycolumn, yyline, yytext());}
{EQUALS}                {return new Symbol(LoginSym.EQUALS, yycolumn, yyline, yytext());}
{GREATERT}              {return new Symbol(LoginSym.GREATERT, yycolumn, yyline, yytext());}
{LESST}                 {return new Symbol(LoginSym.LESST, yycolumn, yyline, yytext());}
{KEYA}                  {return new Symbol(LoginSym.KEYA, yycolumn, yyline, yytext());}
{KEYC}                  {return new Symbol(LoginSym.KEYC, yycolumn, yyline, yytext());}
{BRACKETA}              {return new Symbol(LoginSym.BRACKETA, yycolumn, yyline, yytext());}
{BRACKETC}              {return new Symbol(LoginSym.BRACKETC, yycolumn, yyline, yytext());}
{COMMA}                 {return new Symbol(LoginSym.COMMA, yycolumn, yyline, yytext());}
{DATECREATION}          {return new Symbol(LoginSym.DATECREATION, yycolumn, yyline, yytext());}
{NUMBER}                {return new Symbol(LoginSym.NUMBER, yyline, yycolumn, yytext());}
{NUMBERVERSION}         {return new Symbol(LoginSym.NUMBERVERSION, yyline, yycolumn, yytext());}
{TEXT}                  {return new Symbol(LoginSym.TEXT, yyline, yycolumn, yytext());}
{WHITESPCS}             {/*ignore*/}

[^]                  {/*ignore*/}
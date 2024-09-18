package user.servidor.Flex;

import java_cup.runtime.*;
import java.util.ArrayList;
import user.servidor.Cup.UserParserSym;
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
INREQUESTS        =       "realizar_solicitudes"
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
    return new Symbol(UserParserSym.EOF);
%eofval}

%%

{OPENXS}                {return new Symbol(UserParserSym.OPENXS, yycolumn, yyline, yytext());}
{OPENREQ}               {return new Symbol(UserParserSym.OPENREQ, yycolumn, yyline, yytext());}
{ENDXS}                 {return new Symbol(UserParserSym.ENDXS, yycolumn, yyline, yytext());}
{ENDREQ}                {return new Symbol(UserParserSym.ENDREQ, yycolumn, yyline, yytext());}
{XSON}                  {return new Symbol(UserParserSym.XSON, yycolumn, yyline, yytext());}
{VERSION}               {return new Symbol(UserParserSym.VERSION, yycolumn, yyline, yytext());}
{INREQUEST}             {return new Symbol(UserParserSym.INREQUEST, yycolumn, yyline, yytext());}
{EDREQUEST}             {return new Symbol(UserParserSym.EDREQUEST, yycolumn, yyline, yytext());}
{INREQUESTS}          {return new Symbol(UserParserSym.INREQUEST, yycolumn, yyline, yytext());}
{ENDREQUESTS}           {return new Symbol(UserParserSym.ENDREQUESTS, yycolumn, yyline, yytext());}
{NEWUSER}               {return new Symbol(UserParserSym.NEWUSER, yycolumn, yyline, yytext());}
{USERDATA}              {return new Symbol(UserParserSym.USERDATA, yycolumn, yyline, yytext());}
{USER}                  {return new Symbol(UserParserSym.USER, yycolumn, yyline, yytext());}
{PASSWORD}              {return new Symbol(UserParserSym.PASSWORD, yycolumn, yyline, yytext());}
{NAME}                  {return new Symbol(UserParserSym.NAME, yycolumn, yyline, yytext());}
{INSTITUTION}           {return new Symbol(UserParserSym.INSTITUTION, yycolumn, yyline, yytext());}
{DATE}                  {return new Symbol(UserParserSym.DATE, yycolumn, yyline, yytext());}
{DATEEDIT}              {return new Symbol(UserParserSym.DATEEDIT, yycolumn, yyline, yytext());}
{EDITUSER}              {return new Symbol(UserParserSym.EDITUSER, yycolumn, yyline, yytext());}
{OLDUSER}               {return new Symbol(UserParserSym.OLDUSER, yycolumn, yyline, yytext());}
{NEWPASSWORD}           {return new Symbol(UserParserSym.NEWPASSWORD, yycolumn, yyline, yytext());}
{DELETEUSER}            {return new Symbol(UserParserSym.DELETEUSER, yycolumn, yyline, yytext());}
{EQUALS}                {return new Symbol(UserParserSym.EQUALS, yycolumn, yyline, yytext());}
{GREATERT}              {return new Symbol(UserParserSym.GREATERT, yycolumn, yyline, yytext());}
{LESST}                 {return new Symbol(UserParserSym.LESST, yycolumn, yyline, yytext());}
{KEYA}                  {return new Symbol(UserParserSym.KEYA, yycolumn, yyline, yytext());}
{KEYC}                  {return new Symbol(UserParserSym.KEYC, yycolumn, yyline, yytext());}
{BRACKETA}              {return new Symbol(UserParserSym.BRACKETA, yycolumn, yyline, yytext());}
{BRACKETC}              {return new Symbol(UserParserSym.BRACKETC, yycolumn, yyline, yytext());}
{COMMA}                 {return new Symbol(UserParserSym.COMMA, yycolumn, yyline, yytext());}
{COlON}                 {return new Symbol(UserParserSym.COLON, yycolumn, yyline, yytext());}
{DATECREATION}          {return new Symbol(UserParserSym.DATECREATION, yycolumn, yyline, yytext());}
{TEXT}                  {return new Symbol(UserParserSym.TEXT, yyline, yycolumn, yytext());}
{WHITESPCS}             {/*ignore*/}

[^]                  {/*ignore*/}
package org.proyect1.Flex;

import java_cup.runtime.*;
import java.util.ArrayList;
import user.servidor.Errors.ErrorL;

%%

%public
%class Lexer
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
EXCLAMATION         =       "!"
KEYA                =       "{"
KEYC                =       "}"
BRACKETA            =       "["
BRACKETC            =       "]"
OR                  =       "|"
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
//Send response
INRESPONSE          =       "envio_respuesta"
EDRESPONSE          =       "fin_envio_respuesta"
//Send responses
INITRESPONSES       =       "envio_respuestas"
ENDRESPONSES        =       "fin_envio_respuestas"
//Register user
NEWUSER             =       \""USUARIO_NUEVO"\"
USERDATA            =       \""DATOS_USUARIO"\"
USER                =       \""USUARIO"\"
PASSWORD            =       \""PASSWORD"\"
NAME                =       \""NOMBRE"\"
INSTITUTION         =       \""INSTITUCION"\"
DATE                =       \""FECHA_CREACION"\"
DATEEDIT            =       \""FECHA_MODIFICACION"\"
//Modify user
EDITUSER            =       \""MODIFICAR_USUARIO"\"
OLDUSER             =       \""USUARIO_ANTIGUO"\"
NEWPASSWORD         =       \""NUEVO_PASSWORD"\"
//Delete user for the system
DELETEUSER          =       \""ELIMINAR_USUARIO"\"
//Login user
LOGINUSER           =       \""LOGIN_USUARIO"\"
//Trivia
NEWTRIVIA           =       \""NUEVA_TRIVIA"\"
PARAMETERSTRIVIA    =       \""PARAMETROS_TRIVIA"\"
USERCREATOR         =       \""USUARIO_CREACION"\"
IDTRIVIA            =       \""ID_TRIVIA"\"
TIMEQUESTION        =       \""TIEMPO_PREGUNTA"\"
THEME               =       \""TEMA"\"
//Delete trivia
DELETETRIVIA        =       \""ELIMINAR_TRIVIA"\"
//Modify trivia
EDITTRIVIA          =       \""MODIFICAR_TRIVIA"\"
//Components trivia
ADDCOMPONENT        =       \""AGREGAR_COMPONENTE"\"
PARAMETERSCOMPONENT =       \""PARAMETROS_COMPONENTE"\"
ID                  =       \""ID"\"
TRIVIA              =       \""TRIVIA"
CLASSTRIVIA         =       \""CLASE"\"
TXTVISIBLE          =       \""TEXTO_VISIBLE"\"
RESPONSETRIVIA      =       \""RESPUESTA"\"
//Options trivia
OPTIONS             =       \""OPCIONES"\"
//Delete component trivia
DELETECOMPONENTT    =       \""ELIMINAR_COMPONENTE"\"
//Edit component
EDITCOMPONENT       =       \""MODIFICAR_COMPONENTE"\"
INDEX               =       \""INDICE"\"

TEXTFIELD           =       \""CAMPO_TEXTO"\"
TEXTAREA            =       \""AREA_TEXTO"\"
CHECKBOX            =       \""CHECKBOX"\"
RADIO               =       \""RADIO"\"
CARDINDEX           =       \""FICHERO"\"
COMBO               =       \""COMBO"\"


//REGEX
WHITESPCS       = ([\s\t\r\n]+)
DIGIT           = [0-9]
NUMBER          = ([0-9])+
LETTER          = [a-zA-Z]
TEXT            = \"\¿({LETTER}|_|-|\$)+({LETTER}|{DIGIT}|_)*\?*\"
NUMBERVERSION   = \"([0-9]+(\.[0-9]+)?([eE][-+]?[0-9]+)?) | (\.[0-9]+([eE][-+]?[0-9]+)?)\"
OPTIONSRESPONSES= \"([A-Za-z\s]+(\|[A-Za-z\s]+)*)\"
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
{INRESPONSE}            {return new Symbol(LoginSym.INRESPONSE, yycolumn, yyline, yytext());}
{EDRESPONSE}            {return new Symbol(LoginSym.EDRESPONSE, yycolumn, yyline, yytext());}
{INITRESPONSES}         {return new Symbol(LoginSym.INITRESPONSES, yycolumn, yyline, yytext());}
{ENDRESPONSES}          {return new Symbol(LoginSym.ENDRESPONSES, yycolumn, yyline, yytext());}
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
{LOGINUSER}             {return new Symbol(LoginSym.LOGINUSER, yycolumn, yyline, yytext());}
{NEWTRIVIA}             {return new Symbol(LoginSym.NEWTRIVIA, yycolumn, yyline, yytext());}
{PARAMETERSTRIVIA}      {return new Symbol(LoginSym.PARAMETERSTRIVIA, yycolumn, yyline, yytext());}
{USERCREATOR}           {return new Symbol(LoginSym.USERCREATOR, yycolumn, yyline, yytext());}
{IDTRIVIA}              {return new Symbol(LoginSym.IDTRIVIA, yycolumn, yyline, yytext());}
{TIMEQUESTION}          {return new Symbol(LoginSym.TIMEQUESTION, yycolumn, yyline, yytext());}
{THEME}                 {return new Symbol(LoginSym.THEME, yycolumn, yyline, yytext());}
{DELETETRIVIA}          {return new Symbol(LoginSym.DELETETRIVIA, yycolumn, yyline, yytext());}
{EDITTRIVIA}            {return new Symbol(LoginSym.EDITTRIVIA, yycolumn, yyline, yytext());}
{ADDCOMPONENT}          {return new Symbol(LoginSym.ADDCOMPONENT, yycolumn, yyline, yytext());}
{PARAMETERSCOMPONENT}   {return new Symbol(LoginSym.PARAMETERSCOMPONENT, yycolumn, yyline, yytext());}
{ID}                    {return new Symbol(LoginSym.ID, yycolumn, yyline, yytext());}
{TRIVIA}                {return new Symbol(LoginSym.TRIVIA, yycolumn, yyline, yytext());}
{CLASSTRIVIA}           {return new Symbol(LoginSym.CLASS, yycolumn, yyline, yytext());}
{TXTVISIBLE}            {return new Symbol(LoginSym.TXTVISIBLE, yycolumn, yyline, yytext());}
{RESPONSETRIVIA}        {return new Symbol(LoginSym.RESPONSETRIVIA, yycolumn, yyline, yytext());}
{OPTIONS}               {return new Symbol(LoginSym.OPTIONS, yycolumn, yyline, yytext());}
{DELETECOMPONENTT}      {return new Symbol(LoginSym.DELETECOMPONENTT, yycolumn, yyline, yytext());}
{EDITCOMPONENT}         {return new Symbol(LoginSym.EDITCOMPONENT, yycolumn, yyline, yytext());}
{INDEX}                 {return new Symbol(LoginSym.INDEX, yycolumn, yyline, yytext());}
{TEXTFIELD}             {return new Symbol(LoginSym.TEXTFIELD, yycolumn, yyline, yytext());}
{TEXTAREA}              {return new Symbol(LoginSym.TEXTAREA, yycolumn, yyline, yytext());}
{CHECKBOX}              {return new Symbol(LoginSym.CHECKBOX, yycolumn, yyline, yytext());}
{RADIO}                 {return new Symbol(LoginSym.RADIO, yycolumn, yyline, yytext());}
{CARDINDEX}             {return new Symbol(LoginSym.CARDINDEX, yycolumn, yyline, yytext());}
{COMBO}                 {return new Symbol(LoginSym.COMBO, yycolumn, yyline, yytext());}
{EQUALS}                {return new Symbol(LoginSym.EQUALS, yycolumn, yyline, yytext());}
{GREATERT}              {return new Symbol(LoginSym.GREATERT, yycolumn, yyline, yytext());}
{LESST}                 {return new Symbol(LoginSym.LESST, yycolumn, yyline, yytext());}
{EXCLAMATION}           {return new Symbol(LoginSym.EXCLAMATION, yycolumn, yyline, yytext());}
{KEYA}                  {return new Symbol(LoginSym.KEYA, yycolumn, yyline, yytext());}
{KEYC}                  {return new Symbol(LoginSym.KEYC, yycolumn, yyline, yytext());}
{BRACKETA}              {return new Symbol(LoginSym.BRACKETA, yycolumn, yyline, yytext());}
{BRACKETC}              {return new Symbol(LoginSym.BRACKETC, yycolumn, yyline, yytext());}
{OR}                    {return new Symbol(LoginSym.OR, yycolumn, yyline, yytext());}
{COMMA}                 {return new Symbol(LoginSym.COMMA, yycolumn, yyline, yytext());}
{DATECREATION}          {return new Symbol(LoginSym.DATECREATION, yycolumn, yyline, yytext());}
{NUMBER}                {return new Symbol(LoginSym.NUMBER, yyline, yycolumn, yytext());}
{NUMBERVERSION}         {return new Symbol(LoginSym.NUMBERVERSION, yyline, yycolumn, yytext());}
{OPTIONSRESPONSES}      {return new Symbol(LoginSym.OPTIONSRESPONSES, yyline, yycolumn, yytext());}
{TEXT}                  {return new Symbol(LoginSym.TEXT, yyline, yycolumn, yytext());}
{WHITESPCS}             {/*ignore*/}

[^]                  {/*ignore*/}
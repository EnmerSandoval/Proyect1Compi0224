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
COLON               =       ":"
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
NEWUSER             =       ([\"”“]"USUARIO_NUEVO"[\"”“])
USERDATA            =       ([\"”“]"DATOS_USUARIO"[\"”“])
USER                =       ([\"”“]"USUARIO"[\"”“])
PASSWORD            =       ([\"”“]"PASSWORD"[\"”“])
NAME                =       ([\"”“]"NOMBRE"[\"”“])
INSTITUTION         =       ([\"”“]"INSTITUCION"[\"”“])
DATE                =       ([\"”“]"FECHA_CREACION"[\"”“])
DATEEDIT            =       ([\"”“]"FECHA_MODIFICACION"[\"”“])
//Modify user
EDITUSER            =       ([\"”“]"MODIFICAR_USUARIO"[\"”“])
OLDUSER             =       ([\"”“]"USUARIO_ANTIGUO"[\"”“])
NEWPASSWORD         =       ([\"”“]"NUEVO_PASSWORD"[\"”“])
//Delete user for the system
DELETEUSER          =       ([\"”“]"ELIMINAR_USUARIO"[\"”“])
//Login user
LOGINUSER           =       (\"”“]"LOGIN_USUARIO"[\"”“])
//Trivia
NEWTRIVIA           =       ([\"”“]"NUEVA_TRIVIA"[\"”“])
PARAMETERSTRIVIA    =       ([\"”“]"PARAMETROS_TRIVIA"[\"”“])
USERCREATOR         =       ([\"”“]"USUARIO_CREACION"[\"”“])
IDTRIVIA            =       ([\"”“]"ID_TRIVIA"[\"”“])
TIMEQUESTION        =       ([\"”“]"TIEMPO_PREGUNTA"[\"”“])
THEME               =       ([\"”“]"TEMA"[\"”“])
//Delete trivia
DELETETRIVIA        =       ([\"”“]"ELIMINAR_TRIVIA"[\"”“])
//Modify trivia
EDITTRIVIA          =       ([\"”“]"MODIFICAR_TRIVIA"[\"”“])
//Components trivia
ADDCOMPONENT        =       ([\"”“]"AGREGAR_COMPONENTE"[\"”“])
PARAMETERSCOMPONENT =       ([\"”“]"PARAMETROS_COMPONENTE"[\"”“])
ID                  =       ([\"”“]"ID"[\"”“])
TRIVIA              =       ([\"”“]"TRIVIA"[\"”“])

CLASSTRIVIA         =       ([\"”“]"CLASE"[\"”“])
TXTVISIBLE          =       ([\"”“]"TEXTO_VISIBLE"[\"”“])
RESPONSETRIVIA      =       ([\"”“]"RESPUESTA"[\"”“])
//Options trivia
OPTIONS             =       ([\"”“]"OPCIONES"[\"”“])
//Delete component trivia
DELETECOMPONENTT    =       ([\"”“]"ELIMINAR_COMPONENTE"[\"”“])
//Edit component
EDITCOMPONENT       =       ([\"”“]"MODIFICAR_COMPONENTE"[\"”“])
INDEX               =       ([\"”“]"INDICE"[\"”“])
ROW                 =       ([\"”“]"FILAS"[\"”“])
COLUMN              =       ([\"”“]"COLUMNAS"[\"”“])

TEXTFIELD           =       ([\"”“]"CAMPO_TEXTO"[\"”“])
TEXTAREA            =       ([\"”“]"AREA_TEXTO"[\"”“])
CHECKBOX            =       ([\"”“]"CHECKBOX"[\"”“])
RADIO               =       ([\"”“]"RADIO"[\"”“])
CARDINDEX           =       ([\"”“]"FICHERO"[\"”“])
COMBO               =       ([\"”“]"COMBO"[\"”“])


//REGEX
WHITESPCS       = ([\s\t\r\n]+)
DIGIT           = [0-9]
NUMBER          = ([0-9])+
LETTER          = [a-zA-Z]
TEXT            = {NUMBERVERSION} | ([\"”“]({LETTER}|_|-|\$)+({LETTER}|{DIGIT}|_)*[\"”“])
NUMBERVERSION   = [\"”“]{DIGIT}+(\.{DIGIT}+)? ({LETTER})[\"”“]
OPTIONSRESPONSES= [\"”“]([A-Za-z\s]+(\|[A-Za-z\s]+)*)[\"”“]
DATECREATION    = [\"”“]([0-9]{4}-[0-9]{2}-[0-9]{2})[\"”“]


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

%%

{OPENXS}                {return new Symbol(ParserSym.OPENXS, yycolumn, yyline, yytext());}
{OPENREQ}               {return new Symbol(ParserSym.OPENREQ, yycolumn, yyline, yytext());}
{XSON}                  {return new Symbol(ParserSym.XSON, yycolumn, yyline, yytext());}
{VERSION}               {return new Symbol(ParserSym.VERSION, yycolumn, yyline, yytext());}
{INREQUEST}             {return new Symbol(ParserSym.INREQUEST, yycolumn, yyline, yytext());}
{EDREQUEST}             {return new Symbol(ParserSym.EDREQUEST, yycolumn, yyline, yytext());}
{INITREQUESTS}          {return new Symbol(ParserSym.INITREQUEST, yycolumn, yyline, yytext());}
{ENDREQUESTS}           {return new Symbol(ParserSym.ENDREQUESTS, yycolumn, yyline, yytext());}
{ENDXS}                 {return new Symbol(ParserSym.ENDXS, yycolumn, yyline, yytext());}
{ENDREQ}                {return new Symbol(ParserSym.ENDREQ, yycolumn, yyline, yytext());}
{INRESPONSE}            {return new Symbol(ParserSym.INRESPONSE, yycolumn, yyline, yytext());}
{EDRESPONSE}            {return new Symbol(ParserSym.EDRESPONSE, yycolumn, yyline, yytext());}
{INITRESPONSES}         {return new Symbol(ParserSym.INITRESPONSES, yycolumn, yyline, yytext());}
{ENDRESPONSES}          {return new Symbol(ParserSym.ENDRESPONSES, yycolumn, yyline, yytext());}
{NEWUSER}               {return new Symbol(ParserSym.NEWUSER, yycolumn, yyline, yytext());}
{USERDATA}              {return new Symbol(ParserSym.USERDATA, yycolumn, yyline, yytext());}
{USER}                  {return new Symbol(ParserSym.USER, yycolumn, yyline, yytext());}
{PASSWORD}              {return new Symbol(ParserSym.PASSWORD, yycolumn, yyline, yytext());}
{NAME}                  {return new Symbol(ParserSym.NAME, yycolumn, yyline, yytext());}
{INSTITUTION}           {return new Symbol(ParserSym.INSTITUTION, yycolumn, yyline, yytext());}
{DATE}                  {return new Symbol(ParserSym.DATE, yycolumn, yyline, yytext());}
{DATEEDIT}              {return new Symbol(ParserSym.DATEEDIT, yycolumn, yyline, yytext());}
{EDITUSER}              {return new Symbol(ParserSym.EDITUSER, yycolumn, yyline, yytext());}
{OLDUSER}               {return new Symbol(ParserSym.OLDUSER, yycolumn, yyline, yytext());}
{NEWPASSWORD}           {return new Symbol(ParserSym.NEWPASSWORD, yycolumn, yyline, yytext());}
{DELETEUSER}            {return new Symbol(ParserSym.DELETEUSER, yycolumn, yyline, yytext());}
{LOGINUSER}             {return new Symbol(ParserSym.LOGINUSER, yycolumn, yyline, yytext());}
{NEWTRIVIA}             {return new Symbol(ParserSym.NEWTRIVIA, yycolumn, yyline, yytext());}
{PARAMETERSTRIVIA}      {return new Symbol(ParserSym.PARAMETERSTRIVIA, yycolumn, yyline, yytext());}
{USERCREATOR}           {return new Symbol(ParserSym.USERCREATOR, yycolumn, yyline, yytext());}
{IDTRIVIA}              {return new Symbol(ParserSym.IDTRIVIA, yycolumn, yyline, yytext());}
{TIMEQUESTION}          {return new Symbol(ParserSym.TIMEQUESTION, yycolumn, yyline, yytext());}
{THEME}                 {return new Symbol(ParserSym.THEME, yycolumn, yyline, yytext());}
{DELETETRIVIA}          {return new Symbol(ParserSym.DELETETRIVIA, yycolumn, yyline, yytext());}
{EDITTRIVIA}            {return new Symbol(ParserSym.EDITTRIVIA, yycolumn, yyline, yytext());}
{ADDCOMPONENT}          {return new Symbol(ParserSym.ADDCOMPONENT, yycolumn, yyline, yytext());}
{PARAMETERSCOMPONENT}   {return new Symbol(ParserSym.PARAMETERSCOMPONENT, yycolumn, yyline, yytext());}
{ID}                    {return new Symbol(ParserSym.ID, yycolumn, yyline, yytext());}
{TRIVIA}                {return new Symbol(ParserSym.TRIVIA, yycolumn, yyline, yytext());}
{CLASSTRIVIA}           {return new Symbol(ParserSym.CLASS, yycolumn, yyline, yytext());}
{TXTVISIBLE}            {return new Symbol(ParserSym.TXTVISIBLE, yycolumn, yyline, yytext());}
{RESPONSETRIVIA}        {return new Symbol(ParserSym.RESPONSETRIVIA, yycolumn, yyline, yytext());}
{ROW}                   {return new Symbol(ParserSym.COLUMN, yycolumn, yyline, yytext());}
{COLUMN}                {return new Symbol(ParserSym.COLUMN, yycolumn, yyline, yytext());}
{OPTIONS}               {return new Symbol(ParserSym.OPTIONS, yycolumn, yyline, yytext());}
{DELETECOMPONENTT}      {return new Symbol(ParserSym.DELETECOMPONENTT, yycolumn, yyline, yytext());}
{EDITCOMPONENT}         {return new Symbol(ParserSym.EDITCOMPONENT, yycolumn, yyline, yytext());}
{INDEX}                 {return new Symbol(ParserSym.INDEX, yycolumn, yyline, yytext());}
{TEXTFIELD}             {return new Symbol(ParserSym.TEXTFIELD, yycolumn, yyline, yytext());}
{TEXTAREA}              {return new Symbol(ParserSym.TEXTAREA, yycolumn, yyline, yytext());}
{CHECKBOX}              {return new Symbol(ParserSym.CHECKBOX, yycolumn, yyline, yytext());}
{RADIO}                 {return new Symbol(ParserSym.RADIO, yycolumn, yyline, yytext());}
{CARDINDEX}             {return new Symbol(ParserSym.CARDINDEX, yycolumn, yyline, yytext());}
{COMBO}                 {return new Symbol(ParserSym.COMBO, yycolumn, yyline, yytext());}
{EQUALS}                {return new Symbol(ParserSym.EQUALS, yycolumn, yyline, yytext());}
{GREATERT}              {return new Symbol(ParserSym.GREATERT, yycolumn, yyline, yytext());}
{LESST}                 {return new Symbol(ParserSym.LESST, yycolumn, yyline, yytext());}
{EXCLAMATION}           {return new Symbol(ParserSym.EXCLAMATION, yycolumn, yyline, yytext());}
{KEYA}                  {return new Symbol(ParserSym.KEYA, yycolumn, yyline, yytext());}
{KEYC}                  {return new Symbol(ParserSym.KEYC, yycolumn, yyline, yytext());}
{BRACKETA}              {return new Symbol(ParserSym.BRACKETA, yycolumn, yyline, yytext());}
{BRACKETC}              {return new Symbol(ParserSym.BRACKETC, yycolumn, yyline, yytext());}
{OR}                    {return new Symbol(ParserSym.OR, yycolumn, yyline, yytext());}
{COMMA}                 {return new Symbol(ParserSym.COMMA, yycolumn, yyline, yytext());}
{DATECREATION}          {return new Symbol(ParserSym.DATECREATION, yycolumn, yyline, yytext());}
{NUMBER}                {return new Symbol(ParserSym.NUMBER, yyline, yycolumn, yytext());}
{NUMBERVERSION}         {return new Symbol(ParserSym.NUMBERVERSION, yyline, yycolumn, yytext());}
{COLON}                 {return new Symbol(ParserSym.COLON, yyline, yycolumn, yytext());}
{OPTIONSRESPONSES}      {return new Symbol(ParserSym.OPTIONSRESPONSES, yyline, yycolumn, yytext());}
{TEXT}                  {return new Symbol(ParserSym.TEXT, yyline, yycolumn, yytext());}
{WHITESPCS}             {/*ignore*/}

[^]                     {errors.add(new ErrorL(yytext(), yyline, yycolumn, "Error Lexico", "No coincide este caracter"));}
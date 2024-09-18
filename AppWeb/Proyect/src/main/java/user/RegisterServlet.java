package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import user.servidor.Flex.UserFlex;
import user.servidor.Cup.UserParser;
import user.servidor.Objects.*;
import user.servidor.Errors.ErrorL;
import user.servidor.controller.UserController;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        String text = req.getParameter("registerText");
        System.out.println(text);
        ArrayList<ErrorL> errors =  new ArrayList<>();
        try {
           // UserFlex userFlex = new UserFlex(new StringReader(text));
            //UserParser userParser = new UserParser(userFlex);
            //System.out.println(userParser.parse());
            //if(!userParser.getUsers().isEmpty()){
              //  ArrayList<User> users = userParser.getUsers();
                ArrayList<User> userParser = new ArrayList<>();
                User usere = new User("Juan", "123Bajista", "Osvaldo", "CUNOC", "12/3/2024", 1);
//                User user2 = new User("Alexandra", "aleangel21", "Alexa", "CUSAM", "18/3/2023", 1);
//                User user3 = new User("Mario", "maradoso28", "marod28", "CUSAM", "11/6/2023", 1);
//                User user4 = new User("Valeska", "vale23", "Valeska", "CUM", "12/4/2023", 1);
//
                userParser.add(usere);
//                userParser.add(user2);
//                userParser.add(user3);
//                userParser.add(user4);
                for(User user : userParser){
                    if(user.getFlag() == 1){
                        //crear usuario
                        UserController userController = new UserController();
                        userController.registerUser(userParser);
                    } else if(user.getFlag() == 2){
                        //Editar usuario
                    } else if(user.getFlag() == 3){
                        //Eliminar usuario  v
                    }
                }
                req.setAttribute("success", "Todo fue parseado correctamente");
              //  if(!userParser.getUsers().isEmpty()){
                //    req.setAttribute("error", userParser.getErrors());
               // }
           // } else if(!userParser.getErrors().isEmpty()){
             //   req.setAttribute("errors", userParser.getErrors());
            //}
        }catch (Exception ex){
            ex.printStackTrace();
        }

    }
}

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
        ArrayList<ErrorL> errors =  new ArrayList<>();
        UserFlex userFlex = new UserFlex(new StringReader(text));
        UserParser userParser = new UserParser(userFlex);
        try {
            userParser.parse();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        UserController userController = new UserController();
        if(!userParser.getUsers().isEmpty()){
            ArrayList<User> registerUsers = returnRegisterUsers(userParser.getUsers());
            ArrayList<User> editUsers = returnEditUser(userParser.getUsers());
            ArrayList<User> deleteUsers = returnDeleteUser(userParser.getUsers());
            try {
                if (!registerUsers.isEmpty()) {
                    userController.registerUser(registerUsers);
                }
                if(!editUsers.isEmpty()){
                    userController.editUser(editUsers);
                }

                if(!deleteUsers.isEmpty()){
                    userController.deleteUser(deleteUsers);
                }
            } catch (Exception e){
                throw new RuntimeException(e);
            }
        }



//                req.setAttribute("success", "Todo fue parseado correctamente");
              //  if(!userParser.getUsers().isEmpty()){
                //    req.setAttribute("error", userParser.getErrors());
               // }
           // } else if(!userParser.getErrors().isEmpty()){
             //   req.setAttribute("errors", userParser.getErrors());
            //}


    }

    public ArrayList<User> returnRegisterUsers(ArrayList<User> users){
        ArrayList<User> usersRegister = new ArrayList<>();
        for(User user : users){
            if (user.getFlag() == 1){
                usersRegister.add(user);
            }
        }
        return usersRegister;
    }

    public ArrayList<User> returnEditUser(ArrayList<User> users){
        ArrayList<User> usersEdit = new ArrayList<>();
        for(User user : users){
            if (user.getFlag() == 2){
                usersEdit.add(user);
            }
        }
        return usersEdit;
    }

    public ArrayList<User> returnDeleteUser(ArrayList<User> users){
        ArrayList<User> usersDelete = new ArrayList<>();
        for(User user : users){
            if (user.getFlag() == 3){
                usersDelete.add(user);
            }
        }
        return usersDelete;
    }
}

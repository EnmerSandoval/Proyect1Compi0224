package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import user.servidor.Cup.Login;
import user.servidor.Errors.ErrorL;
import user.servidor.Flex.LoginFlex;
import user.servidor.controller.UserController;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String text = req.getParameter("text");
        try {
            LoginFlex loginFlex = new LoginFlex(new StringReader(text));
            Login login = new Login(loginFlex);
            login.parse();
            ArrayList<ErrorL> errors = new ArrayList<>();
            if(!loginFlex.getErrorsLexicos().isEmpty()){
                errors.addAll(loginFlex.getErrorsLexicos());
            }
            if (!login.getErrors().isEmpty()){
                errors.addAll(login.getErrors());
            }

            if(!errors.isEmpty()){
                String txtError = "";
                for (ErrorL error : errors) {
                    txtError += error.getLexema();
                    txtError += " tipo: " + error.getType();
                    txtError += " fila: " + error.getLine();
                    txtError += " columna: " + error.getColumn();
                    txtError += " descripcion: " + error.getDescription();
                    txtError += "\n";
                }
                req.setAttribute("error", txtError);
                req.getRequestDispatcher("Login.jsp").forward(req, resp);
            } else {
                if(login.getUser() != null){
                    UserController userController = new UserController();
                    if(userController.verificationToLoginUser(login.getUser())){
                        session.setAttribute("user", login.getUser());
                        resp.sendRedirect("Home.jsp");
                    }else{
                        req.setAttribute("error", "No Existe el usuario");
                        req.getRequestDispatcher("Login.jsp").forward(req, resp);
                    }
                } else {
                    req.setAttribute("error", "No fue correcto el comando");
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

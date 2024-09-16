package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import user.servidor.Cup.Login;
import user.servidor.Flex.LoginFlex;

import java.io.IOException;
import java.io.StringReader;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String text = req.getParameter("text");
        System.out.println(text);

        try {
            LoginFlex loginFlex = new LoginFlex(new StringReader(text));
            Login login = new Login(loginFlex);
            System.out.println(login.parse());
            if(login.getUser() != null){
                System.out.println(login.getUser().getPassword());
            }
            if(login.getErrors() != null){
                for (int i = 0; i < login.getErrors().size() ; i++) {
                    System.out.println(login.getErrors().get(i).toString());
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
}

package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import user.servidor.Cup.Parser;
import user.servidor.Errors.ErrorL;
import user.servidor.Flex.Lexer;
import user.servidor.Objects.Trivia;
import user.servidor.controller.TriviaController;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;

@WebServlet("/RegisterTriviaServlet")
public class RegisterTriviaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession session = req.getSession();
        String text = req.getParameter("text");
        Lexer lexer = new Lexer(new StringReader(text));
        Parser parser = new Parser(lexer);

        try {
            parser.parse();
        }catch (Exception e){
            throw new RuntimeException(e);
        }

        ArrayList<ErrorL> erroresSintacticos = new ArrayList<>();
        ArrayList<ErrorL> erroresLexicos = new ArrayList<>();
        ArrayList<ErrorL> errors = new ArrayList<>();

        erroresLexicos = lexer.getErrorsLexicos();
        erroresSintacticos = parser.getErrors();
        errors.addAll(erroresLexicos);
        errors.addAll(erroresSintacticos);


        TriviaController triviaController = new TriviaController();
        if(errors.isEmpty()){
            if(!parser.getTrivias().isEmpty() | !parser.getTrivias().isEmpty()){
                ArrayList<Trivia> createTrivia = new ArrayList<>();
                ArrayList<Trivia> editTrivia = new ArrayList<>();
                ArrayList<Trivia> deleteTrivia = new ArrayList<>();
                for(Trivia trivia : parser.getTrivias()){
                    if(trivia.getFlag() == 1){
                        createTrivia.add(trivia);
                    } else if(trivia.getFlag() == 2){
                        editTrivia.add(trivia);
                    } else if(trivia.getFlag() == 3){
                        deleteTrivia.add(trivia);
                    }
                }

                if(!createTrivia.isEmpty()){
                    try {
                        triviaController.asignComponentsToTrivia(parser.getComponents(), createTrivia);
                    } catch (Exception ex){
                        ex.printStackTrace();
                    }
                }

            }
        }



    }
}

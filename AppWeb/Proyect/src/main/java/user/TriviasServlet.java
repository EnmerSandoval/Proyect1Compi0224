package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import user.servidor.Objects.Component;
import user.servidor.Objects.Trivia;
import user.servidor.controller.TriviaController;

import java.io.IOException;
import java.util.ArrayList;

public class TriviasServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Ando aca");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Trivia trivia = new Trivia("trivia1", "15", "Primera Trivia", "Usuario", "Cultura General", "2024-02-12", 1);
        Trivia trivia2 = new Trivia("trivia2", "20", "Segunda Trivia", "Usuario", "Deportes", "2024-02-12", 1);
        Trivia trivia3 = new Trivia("trivia3", "45", "Tercera Trivia", "Usuario", "Historia", "2024-02-12", 1);
        ArrayList<Trivia> trivias = new ArrayList<>();
        ArrayList<Component> componentTrivia1 = new ArrayList<>();
        ArrayList<Component> componentTrivia2 = new ArrayList<>();
        ArrayList<Component> componentTrivia3 = new ArrayList<>();
        Component com = new Component("Component1", "trivia1", "TEXT_AREA", "PRESIDENTE DE ESTADOS UNIDOS", "JOE BIDEN", 1);
        Component component2 = new Component("Component2", "trivia2", "RADIO", "PRESIDENTE DE ESTADOS UNIDOS", "JOE BIDEN|DONALD TRUMP|KAMALA HARRIS", 1);
        Component component3 = new Component("Component3", "trivia3", "TEXT_AREA", "CORREDOR MAS RAPIDO DE LA HISTORIA", "USAIN BOLT", 1);
        componentTrivia1.add(com);
        componentTrivia2.add(component2);
        componentTrivia2.add(component3);

        trivia.setComponentsTrivia(componentTrivia1);
        trivia2.setComponentsTrivia(componentTrivia2);
        trivia3.setComponentsTrivia(componentTrivia3);

        trivias.add(trivia);
        trivias.add(trivia2);
        trivias.add(trivia3);

        TriviaController triviaController = new TriviaController();
        try {
            triviaController.writeTriviaToFile(trivias);
        }catch (Exception e) {
            e.printStackTrace();
        }

    }
}

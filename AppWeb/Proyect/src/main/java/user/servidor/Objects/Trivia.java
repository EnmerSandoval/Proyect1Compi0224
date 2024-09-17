package user.servidor.Objects;

import java.util.ArrayList;

public class Trivia {
    private String idTrivia;
    private int timeQuestion;
    private String name;
    private String theme;
    private String dateCreation;
    private String userCreator;
    private int flag;
    private ArrayList<Component> componentsTrivia;
    //Create and Modify trivia
    public Trivia(String idTrivia, String name, int timeQuestion, String userCreator,   String theme, String dateCreation, int flag) {
        this.idTrivia = idTrivia;
        this.timeQuestion = timeQuestion;
        this.userCreator = userCreator;
        this.name = name;
        this.theme = theme;
        this.dateCreation = dateCreation;
        this.flag = flag;
    }
    //Delete Trivia
    public Trivia(String idTrivia, int flag) {
        this.idTrivia = idTrivia;
        this.flag = flag;
    }

    //Edit trivia
    public Trivia(String idTrivia, int timeQuestion, String name, String theme, int flag){
        this.idTrivia = idTrivia;
        this.timeQuestion = timeQuestion;
        this.name = name;
        this.theme = theme;
        this.flag = flag;
    }

    public ArrayList<Component> getComponentsTrivia() {
        return componentsTrivia;
    }

    public void setComponentsTrivia(ArrayList<Component> componentsTrivia) {
        this.componentsTrivia = componentsTrivia;
    }

    public String getUserCreator() {
        return userCreator;
    }

    public void setUserCreator(String userCreator) {
        this.userCreator = userCreator;
    }

    public String getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(String dateCreation) {
        this.dateCreation = dateCreation;
    }

    public String getIdTrivia() {
        return idTrivia;
    }

    public void setIdTrivia(String idTrivia) {
        this.idTrivia = idTrivia;
    }

    public int getTimeQuestion() {
        return timeQuestion;
    }

    public void setTimeQuestion(int timeQuestion) {
        this.timeQuestion = timeQuestion;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

}

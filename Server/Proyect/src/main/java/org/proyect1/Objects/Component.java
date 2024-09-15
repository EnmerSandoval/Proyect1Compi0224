package org.proyect1.Objects;

public class Component {
    private String id;
    private String trivia;
    private String classComponent;
    private String txtVisible;
    private String response;
    private int flag;
    private String index;

    //Create Component
    public Component(String id, String trivia, String classComponent, String txtVisible, String response, int flag) {
        this.id = id;
        this.trivia = trivia;
        this.classComponent = classComponent;
        this.txtVisible = txtVisible;
        this.response = response;
        this.flag = flag;
    }
    //Delete Component
    public Component(String id, String trivia, int flag) {
        this.id = id;
        this.trivia = trivia;
        this.flag = flag;
    }

    //Modify Component
    public Component(String id, String trivia, String classComponent, String index, String txtVisible, String response, int flag) {
        this.id = id;
        this.trivia = trivia;
        this.classComponent = classComponent;
        this.index = index;
        this.txtVisible = txtVisible;
        this.response = response;
        this.flag = flag;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTrivia() {
        return trivia;
    }

    public void setTrivia(String trivia) {
        this.trivia = trivia;
    }

    public String getClassComponent() {
        return classComponent;
    }

    public void setClassComponent(String classComponent) {
        this.classComponent = classComponent;
    }

    public String getTxtVisible() {
        return txtVisible;
    }

    public void setTxtVisible(String txtVisible) {
        this.txtVisible = txtVisible;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }
}
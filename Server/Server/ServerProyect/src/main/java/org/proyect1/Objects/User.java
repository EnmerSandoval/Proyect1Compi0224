package org.proyect1.Objects;

public class User {
    private String username;
    private String password;
    private String name;
    private String institution;
    private String userOld;
    private String newUser;
    private String dateCreation;
    private int flag;

    public User(String username, String password, String name, String institution, String dateCreation, int flag) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.institution = institution;
        this.dateCreation = dateCreation;
        this.flag = flag;
    }

    public User(String userOld, String newUser, String password, String institution,  int flag, String dateCreation) {
        this.userOld = userOld;
        this.newUser = newUser;
        this.password = password;
        this.institution = institution;
        this.flag = flag;
        this.dateCreation = dateCreation;
    }

    public User(String username, int flag) {
        this.username = username;
        this.flag = flag;
    }

    public User(String username) {
        this.username = username;
    }

    //Empty Construct
    public User(){}

    public String getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(String dateCreation) {
        this.dateCreation = dateCreation;
    }

    public User(String username, String password, int flag) {
        this.username = username;
        this.password = password;
        this.flag = flag;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getUserOld() {
        return userOld;
    }

    public void setUserOld(String userOld) {
        this.userOld = userOld;
    }

    public String getNewUser() {
        return newUser;
    }

    public void setNewUser(String newUser) {
        this.newUser = newUser;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

}

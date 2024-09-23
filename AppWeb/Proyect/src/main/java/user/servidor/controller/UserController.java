package user.servidor.controller;

import java.io.*;
import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.Scanner;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import user.servidor.Objects.*;
import user.servidor.Cup.json.UserJson;
import user.servidor.Flex.json.UserJsonFlex;

public class UserController {

    private final String userdbPath = "D:/Universidad/ProyectoCompi1/AppWeb/Proyect/src/main/java/user/servidor/files/userdb.json";
    private final String userdbPackage = "D:/Universidad/ProyectoCompi1/AppWeb/Proyect/src/main/java/user/servidor/files/userdb.json";

    private ArrayList<User> users;
    private User user;

    public UserController(ArrayList<User> users) {
        this.users = users;
    }

    public UserController(User user) {
        this.user = user;
    }

    public UserController() {
    }

    public boolean existFileUserBd(){
        File file = new File(userdbPath);
        return file.exists() && !file.isDirectory();
    }

    public ArrayList<User> returnUsersJson() throws Exception{
        String textUser = readFiles();
        if(existFileUserBd()){
            UserJsonFlex userJsonFlex = new UserJsonFlex(new StringReader(textUser));
            UserJson userJson = new UserJson(userJsonFlex);
            userJson.parse();
            if(userJson.getUsers() != null && !userJson.getUsers().isEmpty()){
                return userJson.getUsers();
            } else {
                return new ArrayList<>();
            }
        } else {
            return new ArrayList<>();
        }
    }

    public void registerUser(ArrayList<User> users) throws Exception {
        ArrayList<User> usersToRegister = returnUsersJson();
        if (existFileUserBd()) {
            if (!usersToRegister.isEmpty()) {
                for (User user : users) {
                    if (!verificationToExistUser(user)) {;
                        usersToRegister.add(user);
                    } else {
                        System.out.println("El usuario ya existe");
                    }
                }
            } else {
                usersToRegister.addAll(users);
            }
        } else {
            usersToRegister.addAll(users);
        }
        writeUsersToFile(usersToRegister);
    }

    public void editUser(ArrayList<User> users) throws Exception{
        ArrayList<User> userToEdit = returnUsersJson();
        if (existFileUserBd()){
            if(!userToEdit.isEmpty()){
                for (User user : users) {
                    if (verificationToExistUser(user)) {
                        User userEdited = new User();
                        userEdited.setName(user.getName());
                        userEdited.setPassword(user.getPassword());
                        if(!user.getInstitution().equals("")){
                            userEdited.setInstitution(user.getInstitution());
                        }
                        userToEdit.add(userEdited);
                    } else {
                        userToEdit.add(user);
                    }
                }
            }
        }
        writeUsersToFile(userToEdit);
    }

    public void deleteUser(ArrayList<User> users) throws Exception{
        ArrayList<User> userToDelete = returnUsersJson();
        if (existFileUserBd()){
            if(!userToDelete.isEmpty()){
                for (User user : users) {
                    if (verificationToExistUser(user)) {
                        userToDelete.remove(iteratorUser(user));
                    }
                }
            }
        }
        writeUsersToFile(userToDelete);
    }

    public void writeUsersToFile(ArrayList<User> usersToRegister) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayNode usersArray = objectMapper.createArrayNode();

        for (User user : usersToRegister) {
            ObjectNode userJson = objectMapper.createObjectNode();
            System.out.println(user.getUsername());
            userJson.put("USUARIO", user.getUsername());
            userJson.put("PASSWORD", user.getPassword());
            userJson.put("INSTITUCION", user.getInstitution());
            userJson.put("NOMBRE", user.getName());
            userJson.put("FECHA_CREACION", user.getDateCreation());
            usersArray.add(userJson);
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(userdbPackage))) {
            objectMapper.writeValue(writer, usersArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean verificationToLoginUser(User user) throws Exception{
        boolean verified = false;
        ArrayList<User> userJson = returnUsersJson();
        if(userJson != null && !userJson.isEmpty()){
            for (User userVerified : userJson) {
                if (userVerified.getUsername().equals(user.getUsername()) && userVerified.getPassword().equals(user.getPassword())) {
                    verified = true;
                    break;
                }
            }
        } else {
            verified = false;
        }
        return verified;
    }

    public boolean verificationToExistUser(User user) throws Exception{
        boolean verified = false;
        ArrayList<User> userJson = returnUsersJson();
        if(userJson != null && !userJson.isEmpty()){
            for (User userVerified : userJson) {
                if(userVerified.getUsername().equals(user.getUsername())){
                    verified = true;
                    break;
                }
            }
        }
        return verified;
    }

    public int iteratorUser(User user) throws Exception{
        int iterator = 0;
        ArrayList<User> userJson = returnUsersJson();
        if(userJson != null && !userJson.isEmpty()){
            for (User userVerified : userJson) {
                if(userVerified.getUsername().equals(user.getUsername())){
                    break;
                }
                iterator++;
            }
        }
        return iterator;
    }

    public String readFiles(){
        StringBuilder stringBuilder = new StringBuilder();
        if(existFileUserBd()){
            try(BufferedReader bufferedReader = new BufferedReader(new FileReader(userdbPath))) {
                String line;
                while ((line = bufferedReader.readLine()) != null) {
                    stringBuilder.append(line).append("\n");
                }
            }catch (IOException ex){
                ex.printStackTrace();
            }
        }
        return stringBuilder.toString();
    }
}

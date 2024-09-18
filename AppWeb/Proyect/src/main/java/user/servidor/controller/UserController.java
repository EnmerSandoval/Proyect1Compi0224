package user.servidor.controller;

import java.io.*;
import java.util.ArrayList;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import user.servidor.Objects.*;

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

    public void registerUser(ArrayList<User> users) throws Exception{
        File file = new File(userdbPath);
        if(file.exists() && !file.isDirectory()){
            //parsear file
        } else {
            ObjectMapper objectMapper = new ObjectMapper();
            ArrayNode usersArray;
            usersArray = objectMapper.createArrayNode();

            for (User user : users) {
                ObjectNode userJson = objectMapper.createObjectNode();
                userJson.put("USUARIO", user.getUsername());
                userJson.put("PASSWORD", user.getPassword());
                userJson.put("INSTITUCION", user.getInstitution());
                userJson.put("NOMBRE", user.getName());
                userJson.put("FECHA_CREACION", user.getDateCreation());
                usersArray.add(userJson);
            }

                try(BufferedWriter writer = new BufferedWriter(new FileWriter(userdbPackage))){
                    objectMapper.writeValue(writer, usersArray);
                }catch (Exception e){
                    e.printStackTrace();
                }
        }
    }
}

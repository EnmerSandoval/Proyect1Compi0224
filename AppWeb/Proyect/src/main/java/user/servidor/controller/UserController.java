package user.servidor.controller;

import java.io.*;
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

    public void registerUser(ArrayList<User> users) throws Exception{
        File file = new File(userdbPath);
        if(file.exists() && !file.isDirectory()){
            String text = readFiles();
            System.out.println(text);
            UserJsonFlex userJsonFlex = new UserJsonFlex(new StringReader(text));
            UserJson userJson = new UserJson(userJsonFlex);
            System.out.println(userJson.parse());
//            userJson.parse();
            System.out.println(userJson.getUsers().size());
            if(!userJson.getUsers().isEmpty()){
                for(User u : userJson.getUsers()){
                    System.out.println(u.getUsername());
                    System.out.println(u.getPassword());
                    System.out.println(u.getInstitution());
                    System.out.println(u.getName());
                    System.out.println(u.getDateCreation());
                }
            }
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

    public String readFiles(){
        StringBuilder stringBuilder = new StringBuilder();
        try(BufferedReader bufferedReader = new BufferedReader(new FileReader(userdbPath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                stringBuilder.append(line).append("\n");
            }
        }catch (IOException ex){
            ex.printStackTrace();
        }
        return stringBuilder.toString();
    }
}

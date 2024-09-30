package user.servidor.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import user.servidor.Objects.*;

import java.io.*;
import java.util.ArrayList;

public class TriviaController {
    private final String triviadbPath = "D:/Universidad/ProyectoCompi1/AppWeb/Proyect/src/main/java/user/servidor/files/triviasdb.json";
    private final String triviaPackage = "D:/Universidad/ProyectoCompi1/AppWeb/Proyect/src/main/java/user/servidor/files/triviasdb.json";

    private ArrayList<Trivia> trivias;
    private Trivia trivia;

    public TriviaController(ArrayList<Trivia> trivias) {
        this.trivias = trivias;
    }

    public TriviaController(Trivia trivia){
        this.trivia = trivia;
    }

    public TriviaController() {
    }

    public boolean existFileTriviaBd(){
        File file = new File(triviadbPath);
        return file.exists() && !file.isDirectory();
    }

    public boolean deleteTrivia(ArrayList<Trivia> trivias) throws Exception{
        boolean flag = false;
        ArrayList<Trivia> triviaToDelete = returnTriviaJson();
        if(existFileTriviaBd()){
            if(!triviaToDelete.isEmpty()){
                for(Trivia t : triviaToDelete){
                    if(verificationToExistTrivia(t)){
                        triviaToDelete.remove(t);
                        flag = true;
                    }
                }
            }
        }
        writeTriviaToFile(triviaToDelete);
        return flag;
    }


    public boolean deleteComponentTrivia(ArrayList<Component> components) throws Exception{
        boolean flag = false;
        ArrayList<Component> componentDelete = new ArrayList<>();
        if(!components.isEmpty()){
            for (int i = 0; i < components.size(); i++){
                Trivia trivia1 = returnTrivia(components.get(i));
                if(!trivia1.getComponentsTrivia().isEmpty()){
                    for (int j = 0; j < trivia1.getComponentsTrivia().size(); j++){
                        if(trivia1.getComponentsTrivia().get(i).getId().equals(components.get(i).getTrivia())){
                            components.remove(i);
                            flag = true;
                            break;
                        }
                    }
                }
            }
        }
        return flag;
    }


    public Trivia returnTrivia(Component component) throws Exception{
        ArrayList<Trivia> trivias1 = returnTriviaJson();
        Trivia triviaReturn = new Trivia();
        if(!trivias1.isEmpty()){
            for(Trivia t : trivias1){
                if(t.getIdTrivia().equals(component.getTrivia())){
                    triviaReturn = t;
                }
            }
        }
        return triviaReturn;
    }

    public ArrayList<Trivia> returnTriviaJson() throws Exception{
        String textTrivia = readFiles();

        return new ArrayList<Trivia>();
    }

    public void asignComponentsToTrivia(ArrayList<Component> components, ArrayList<Trivia> trivias) throws Exception {
        ArrayList<Trivia> triviatToSave = new ArrayList<>();
      if(existFileTriviaBd()){
          ArrayList<Trivia> triviaToAsign = returnTriviaJson();
          if(!triviaToAsign.isEmpty()){
              for (Trivia t2 : trivias){
                if(!verificationToExistTrivia(t2)){
                    triviaToAsign.add(t2);
                }
              }
          }
          for (Trivia trivia1 : trivias){
            for(Component component : components){
                if(component.getTrivia().equals(trivia1.getIdTrivia())){
                    if(!componentToTrivia(trivia1, component)){
                        trivia1.addComponentToArrayList(component);
                        components.remove(component);
                    }
                }
                triviatToSave.add(trivia1);
            }
          }
      } else {
          if(!trivias.isEmpty()){
            for (Trivia trivia1 : trivias){
                for(Component component : components){
                    if(component.getTrivia().equals(trivia1.getIdTrivia())){
                        if(!componentToTrivia(trivia1, component)){
                            trivia1.addComponentToArrayList(component);
                            components.remove(component);
                        }
                    }
                }
                triviatToSave.add(trivia1);
            }
          }
      }
      writeTriviaToFile(triviatToSave);
    }

    public boolean componentToTrivia(Trivia trivia, Component component){
        boolean flag = false;
        for(Component component1 : trivia.getComponentsTrivia()){
            if(component1.getId().equals(component.getId())){
                flag = true;
            }
        }
        return flag;
    }

    public void writeTriviaToFile(ArrayList<Trivia> trivias) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayNode triviaArray = objectMapper.createArrayNode();

        for (Trivia trivia1 : trivias) {
            ObjectNode triviaJson = objectMapper.createObjectNode();
            triviaJson.put("ID", trivia1.getIdTrivia());
            triviaJson.put("TIME", trivia1.getTimeQuestion());
            triviaJson.put("NAME", trivia1.getName());
            triviaJson.put("THEME", trivia1.getTheme());
            triviaJson.put("DATE", trivia1.getDateCreation());
            triviaJson.put("USER", trivia1.getUserCreator());

            ArrayNode componentsArray = objectMapper.createArrayNode();
            if (trivia1.getComponentsTrivia() != null) {
                for (Component component : trivia1.getComponentsTrivia()) {
                    ObjectNode componentJson = objectMapper.createObjectNode();
                    componentJson.put("ID", component.getId());
                    componentJson.put("CLASS", component.getClassComponent());
                    componentJson.put("INDEX", component.getIndex());
                    componentJson.put("TXT_VISIBLE", component.getTxtVisible());
                    componentJson.put("RESPONSE", component.getResponse());
                    componentJson.put("ROWS", component.getRows());
                    componentJson.put("COLS", component.getCols());
                    componentsArray.add(componentJson);
                }
            }
            triviaJson.set("COMPONENTS", componentsArray);
            triviaArray.add(triviaJson);
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(triviaPackage))) {
            objectMapper.writeValue(writer, triviaArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean verificationToExistTrivia(Trivia trivia) throws Exception{
        boolean verified = false;
        ArrayList<Trivia> triviaArray = returnTriviaJson();
        if(triviaArray != null && !triviaArray.isEmpty()){
            for (Trivia trivia1 : triviaArray) {
                if(trivia.getIdTrivia().equals(trivia1.getIdTrivia())){
                    verified = true;
                    break;
                }
            }
        }
        return verified;
    }

    public int iteratorTrivia(Trivia trivia) throws Exception{
        int iterator = 0;
        ArrayList<Trivia> triviaJson = returnTriviaJson();
        if(triviaJson != null && !triviaJson.isEmpty()){
            for (Trivia trivia1 : triviaJson) {
                if(trivia1.getIdTrivia().equals(trivia.getIdTrivia())){
                    break;
                }
                iterator++;
            }
        }
        return iterator;
    }

    public String readFiles() throws Exception{
        StringBuilder stringBuilder = new StringBuilder();
        if(existFileTriviaBd()){
            try(BufferedReader bufferedReader = new BufferedReader(new FileReader(triviadbPath))) {
                String line;
                while ((line = bufferedReader.readLine()) != null){
                    stringBuilder.append(line);
                }
            }catch (IOException ex ){
                ex.printStackTrace();
            }
        }
        return stringBuilder.toString();
    }
}
package com.ecust.find.util.json;


import java.text.SimpleDateFormat;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Jackson {

    private static ObjectMapper mapper = new ObjectMapper();


    static {
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
    }
    
    public static String toJson(Object obj) {
        try {       	
            return mapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            System.out.println("==========Jackson exception==========");
            e.printStackTrace();
            return null;
        }
    }

}


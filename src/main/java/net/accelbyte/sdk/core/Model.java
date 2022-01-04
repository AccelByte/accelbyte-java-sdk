package net.accelbyte.sdk.core;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;
import java.util.Map;

public class Model {

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        return new HashMap<>();
    }
}



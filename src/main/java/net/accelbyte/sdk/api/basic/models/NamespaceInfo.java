package net.accelbyte.sdk.api.basic.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class NamespaceInfo extends Model {

    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("status")
    String status;
    @JsonProperty("updatedAt")
    String updatedAt;

    public NamespaceInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("displayName", "displayName");
        result.put("namespace", "namespace");
        result.put("status", "status");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
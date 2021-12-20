package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsSession extends Model {

    @JsonProperty("Server")
    ModelsServer server;
    @JsonProperty("id")
    String id;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("provider")
    String provider;
    @JsonProperty("region")
    String region;

    public ModelsSession createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Server", "server");
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("provider", "provider");
        result.put("region", "region");
        return result;
    }
}
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
public class ModelsPodConfigRecord extends Model {

    @JsonProperty("cpu_limit")
    Integer cpuLimit;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("mem_limit")
    Integer memLimit;
    @JsonProperty("modifiedBy")
    String modifiedBy;
    @JsonProperty("name")
    String name;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("params")
    String params;
    @JsonProperty("updatedAt")
    String updatedAt;

    public ModelsPodConfigRecord createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("cpu_limit", "cpuLimit");
        result.put("createdAt", "createdAt");
        result.put("mem_limit", "memLimit");
        result.put("modifiedBy", "modifiedBy");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("params", "params");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
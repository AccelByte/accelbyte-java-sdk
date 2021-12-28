package net.accelbyte.sdk.api.dsmc.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class ModelsUpdatePodConfigRequest extends Model {

    @JsonProperty("cpu_limit")
    private Integer cpuLimit;

    @JsonProperty("mem_limit")
    private Integer memLimit;

    @JsonProperty("name")
    private String name;

    @JsonProperty("params")
    private String params;

    public ModelsUpdatePodConfigRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsUpdatePodConfigRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUpdatePodConfigRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("cpu_limit", "cpuLimit");
        result.put("mem_limit", "memLimit");
        result.put("name", "name");
        result.put("params", "params");
        return result;
    }
}
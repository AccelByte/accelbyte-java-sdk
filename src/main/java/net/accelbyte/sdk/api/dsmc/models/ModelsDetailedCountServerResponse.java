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
public class ModelsDetailedCountServerResponse extends Model {

    @JsonProperty("busy_count")
    private Integer busyCount;

    @JsonProperty("creating_count")
    private Integer creatingCount;

    @JsonProperty("ready_count")
    private Integer readyCount;

    @JsonProperty("unreachable_count")
    private Integer unreachableCount;

    public ModelsDetailedCountServerResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsDetailedCountServerResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsDetailedCountServerResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("busy_count", "busyCount");
        result.put("creating_count", "creatingCount");
        result.put("ready_count", "readyCount");
        result.put("unreachable_count", "unreachableCount");
        return result;
    }
}
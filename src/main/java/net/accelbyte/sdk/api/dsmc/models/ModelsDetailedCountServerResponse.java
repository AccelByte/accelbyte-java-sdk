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
public class ModelsDetailedCountServerResponse extends Model {

    @JsonProperty("busy_count")
    Integer busyCount;
    @JsonProperty("creating_count")
    Integer creatingCount;
    @JsonProperty("ready_count")
    Integer readyCount;
    @JsonProperty("unreachable_count")
    Integer unreachableCount;

    public ModelsDetailedCountServerResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
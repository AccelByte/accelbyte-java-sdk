package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsUpdatePlayerPlaytimeWeightResponse extends Model {

    @JsonProperty("playtime")
    private String playtime;

    @JsonProperty("userID")
    private String userID;

    @JsonProperty("weight")
    private Float weight;

    public ModelsUpdatePlayerPlaytimeWeightResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsUpdatePlayerPlaytimeWeightResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUpdatePlayerPlaytimeWeightResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("playtime", "playtime");
        result.put("userID", "userID");
        result.put("weight", "weight");
        return result;
    }
}
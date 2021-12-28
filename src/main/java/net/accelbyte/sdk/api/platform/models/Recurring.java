package net.accelbyte.sdk.api.platform.models;

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
public class Recurring extends Model {

    @JsonProperty("cycle")
    private String cycle;

    @JsonProperty("fixedFreeDays")
    private Integer fixedFreeDays;

    @JsonProperty("fixedTrialCycles")
    private Integer fixedTrialCycles;

    @JsonProperty("graceDays")
    private Integer graceDays;

    public Recurring createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<Recurring> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<Recurring>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("cycle", "cycle");
        result.put("fixedFreeDays", "fixedFreeDays");
        result.put("fixedTrialCycles", "fixedTrialCycles");
        result.put("graceDays", "graceDays");
        return result;
    }
}
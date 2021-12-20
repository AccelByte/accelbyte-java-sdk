package net.accelbyte.sdk.api.gdpr.models;

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
public class ModelsPagination extends Model {

    @JsonProperty("First")
    String first;
    @JsonProperty("Last")
    String last;
    @JsonProperty("Next")
    String next;
    @JsonProperty("Previous")
    String previous;

    public ModelsPagination createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("First", "first");
        result.put("Last", "last");
        result.put("Next", "next");
        result.put("Previous", "previous");
        return result;
    }
}
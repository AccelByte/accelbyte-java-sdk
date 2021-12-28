package net.accelbyte.sdk.api.social.models;

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
public class BulkStatItemOperationResult extends Model {

    @JsonProperty("details")
    private Map<String, ?> details;

    @JsonProperty("statCode")
    private String statCode;

    @JsonProperty("success")
    private Boolean success;

    public BulkStatItemOperationResult createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<BulkStatItemOperationResult> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<BulkStatItemOperationResult>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("details", "details");
        result.put("statCode", "statCode");
        result.put("success", "success");
        return result;
    }
}
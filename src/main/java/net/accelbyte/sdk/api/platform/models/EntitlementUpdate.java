package net.accelbyte.sdk.api.platform.models;

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
public class EntitlementUpdate extends Model {

    @JsonProperty("endDate")
    String endDate;
    @JsonProperty("nullFieldList")
    List<String> nullFieldList;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("startDate")
    String startDate;
    @JsonProperty("status")
    String status;
    @JsonProperty("useCount")
    Integer useCount;

    public EntitlementUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("endDate", "endDate");
        result.put("nullFieldList", "nullFieldList");
        result.put("quantity", "quantity");
        result.put("startDate", "startDate");
        result.put("status", "status");
        result.put("useCount", "useCount");
        return result;
    }
}
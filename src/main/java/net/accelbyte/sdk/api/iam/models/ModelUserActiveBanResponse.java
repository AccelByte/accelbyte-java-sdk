package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserActiveBanResponse extends Model {

    @JsonProperty("Ban")
    String ban;
    @JsonProperty("BanId")
    String banId;
    @JsonProperty("EndDate")
    String endDate;

    public ModelUserActiveBanResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Ban", "ban");
        result.put("BanId", "banId");
        result.put("EndDate", "endDate");
        return result;
    }
}
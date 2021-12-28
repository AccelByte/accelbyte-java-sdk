package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserActiveBanResponseV3 extends Model {

    @JsonProperty("ban")
    private String ban;

    @JsonProperty("banId")
    private String banId;

    @JsonProperty("endDate")
    private String endDate;

    public ModelUserActiveBanResponseV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelUserActiveBanResponseV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserActiveBanResponseV3>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ban", "ban");
        result.put("banId", "banId");
        result.put("endDate", "endDate");
        return result;
    }
}
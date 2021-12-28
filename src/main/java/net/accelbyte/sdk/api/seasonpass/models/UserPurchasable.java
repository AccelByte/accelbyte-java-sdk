package net.accelbyte.sdk.api.seasonpass.models;

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
public class UserPurchasable extends Model {

    @JsonProperty("passItemId")
    String passItemId;
    @JsonProperty("tierItemId")
    String tierItemId;
    @JsonProperty("tierItemCount")
    Integer tierItemCount;

    public UserPurchasable createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("passItemId", "passItemId");
        result.put("tierItemId", "tierItemId");
        result.put("tierItemCount", "tierItemCount");
        return result;
    }
}
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
public class AccountcommonBanV3 extends Model {

    @JsonProperty("ban")
    String ban;
    @JsonProperty("description")
    String description;
    @JsonProperty("descriptions")
    AccountcommonDescription descriptions;
    @JsonProperty("type")
    String type;

    public AccountcommonBanV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ban", "ban");
        result.put("description", "description");
        result.put("descriptions", "descriptions");
        result.put("type", "type");
        return result;
    }
}
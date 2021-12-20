package net.accelbyte.sdk.api.social.models;

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
public class UserSlotConfigInfo extends Model {

    @JsonProperty("maxSlotSize")
    Integer maxSlotSize;
    @JsonProperty("maxSlots")
    Integer maxSlots;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("userId")
    String userId;

    public UserSlotConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("maxSlotSize", "maxSlotSize");
        result.put("maxSlots", "maxSlots");
        result.put("namespace", "namespace");
        result.put("userId", "userId");
        return result;
    }
}
package net.accelbyte.sdk.api.lobby.models;

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
public class ModelsAdminGetProfanityListsListResponse extends Model {

    @JsonProperty("isEnabled")
    Boolean isEnabled;
    @JsonProperty("isMandatory")
    Boolean isMandatory;
    @JsonProperty("name")
    String name;

    public ModelsAdminGetProfanityListsListResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("isEnabled", "isEnabled");
        result.put("isMandatory", "isMandatory");
        result.put("name", "name");
        return result;
    }
}
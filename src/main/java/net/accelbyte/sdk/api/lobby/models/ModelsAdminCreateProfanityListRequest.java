package net.accelbyte.sdk.api.lobby.models;

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
public class ModelsAdminCreateProfanityListRequest extends Model {

    @JsonProperty("isEnabled")
    private Boolean isEnabled;

    @JsonProperty("isMandatory")
    private Boolean isMandatory;

    @JsonProperty("name")
    private String name;

    public ModelsAdminCreateProfanityListRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsAdminCreateProfanityListRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAdminCreateProfanityListRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("isEnabled", "isEnabled");
        result.put("isMandatory", "isMandatory");
        result.put("name", "name");
        return result;
    }
}
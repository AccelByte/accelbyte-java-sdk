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
public class ModelsAdminGetProfanityListsListResponse extends Model {

    @JsonProperty("isEnabled")
    private Boolean isEnabled;

    @JsonProperty("isMandatory")
    private Boolean isMandatory;

    @JsonProperty("name")
    private String name;

    public ModelsAdminGetProfanityListsListResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsAdminGetProfanityListsListResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAdminGetProfanityListsListResponse>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("isEnabled", "isEnabled");
        result.put("isMandatory", "isMandatory");
        result.put("name", "name");
        return result;
    }
}
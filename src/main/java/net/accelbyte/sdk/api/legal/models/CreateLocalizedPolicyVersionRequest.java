package net.accelbyte.sdk.api.legal.models;

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
public class CreateLocalizedPolicyVersionRequest extends Model {

    @JsonProperty("contentType")
    private String contentType;

    @JsonProperty("description")
    private String description;

    @JsonProperty("localeCode")
    private String localeCode;

    public CreateLocalizedPolicyVersionRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<CreateLocalizedPolicyVersionRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<CreateLocalizedPolicyVersionRequest>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("contentType", "contentType");
        result.put("description", "description");
        result.put("localeCode", "localeCode");
        return result;
    }
}
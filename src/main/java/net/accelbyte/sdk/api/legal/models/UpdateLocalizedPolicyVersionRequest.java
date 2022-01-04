package net.accelbyte.sdk.api.legal.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class UpdateLocalizedPolicyVersionRequest extends Model {

    @JsonProperty("attachmentChecksum")
    private String attachmentChecksum;

    @JsonProperty("attachmentLocation")
    private String attachmentLocation;

    @JsonProperty("attachmentVersionIdentifier")
    private String attachmentVersionIdentifier;

    @JsonProperty("contentType")
    private String contentType;

    @JsonProperty("description")
    private String description;

    @JsonIgnore
    public UpdateLocalizedPolicyVersionRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<UpdateLocalizedPolicyVersionRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<UpdateLocalizedPolicyVersionRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("attachmentChecksum", "attachmentChecksum");
        result.put("attachmentLocation", "attachmentLocation");
        result.put("attachmentVersionIdentifier", "attachmentVersionIdentifier");
        result.put("contentType", "contentType");
        result.put("description", "description");
        return result;
    }
}
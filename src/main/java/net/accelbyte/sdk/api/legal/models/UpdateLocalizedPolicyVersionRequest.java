package net.accelbyte.sdk.api.legal.models;

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
public class UpdateLocalizedPolicyVersionRequest extends Model {

    @JsonProperty("attachmentChecksum")
    String attachmentChecksum;
    @JsonProperty("attachmentLocation")
    String attachmentLocation;
    @JsonProperty("attachmentVersionIdentifier")
    String attachmentVersionIdentifier;
    @JsonProperty("contentType")
    String contentType;
    @JsonProperty("description")
    String description;

    public UpdateLocalizedPolicyVersionRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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
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
public class UploadLocalizedPolicyVersionAttachmentResponse extends Model {

    @JsonProperty("attachmentChecksum")
    private String attachmentChecksum;

    @JsonProperty("attachmentLocation")
    private String attachmentLocation;

    @JsonProperty("attachmentUploadUrl")
    private String attachmentUploadUrl;

    @JsonIgnore
    public UploadLocalizedPolicyVersionAttachmentResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<UploadLocalizedPolicyVersionAttachmentResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<UploadLocalizedPolicyVersionAttachmentResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("attachmentChecksum", "attachmentChecksum");
        result.put("attachmentLocation", "attachmentLocation");
        result.put("attachmentUploadUrl", "attachmentUploadUrl");
        return result;
    }
}
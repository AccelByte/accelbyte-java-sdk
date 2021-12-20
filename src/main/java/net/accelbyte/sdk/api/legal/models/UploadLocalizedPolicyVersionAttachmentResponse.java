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
public class UploadLocalizedPolicyVersionAttachmentResponse extends Model {

    @JsonProperty("attachmentChecksum")
    String attachmentChecksum;
    @JsonProperty("attachmentLocation")
    String attachmentLocation;
    @JsonProperty("attachmentUploadUrl")
    String attachmentUploadUrl;

    public UploadLocalizedPolicyVersionAttachmentResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("attachmentChecksum", "attachmentChecksum");
        result.put("attachmentLocation", "attachmentLocation");
        result.put("attachmentUploadUrl", "attachmentUploadUrl");
        return result;
    }
}
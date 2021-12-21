package net.accelbyte.sdk.api.platform.models;

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
public class XsollaConfig extends Model {

    @JsonProperty("apiKey")
    String apiKey;
    @JsonProperty("flowCompletionUrl")
    String flowCompletionUrl;
    @JsonProperty("merchantId")
    Integer merchantId;
    @JsonProperty("projectId")
    Integer projectId;
    @JsonProperty("projectSecretKey")
    String projectSecretKey;

    public XsollaConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("apiKey", "apiKey");
        result.put("flowCompletionUrl", "flowCompletionUrl");
        result.put("merchantId", "merchantId");
        result.put("projectId", "projectId");
        result.put("projectSecretKey", "projectSecretKey");
        return result;
    }
}
package net.accelbyte.sdk.api.iam.models;

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
public class OauthmodelErrorResponse extends Model {

    @JsonProperty("error")
    String error;
    @JsonProperty("error_description")
    String errorDescription;
    @JsonProperty("error_uri")
    String errorUri;

    public OauthmodelErrorResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("error", "error");
        result.put("error_description", "errorDescription");
        result.put("error_uri", "errorUri");
        return result;
    }
}
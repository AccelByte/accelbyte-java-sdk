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
public class GoogleIAPConfigInfo extends Model {

    @JsonProperty("applicationName")
    String applicationName;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("p12FileName")
    String p12FileName;
    @JsonProperty("serviceAccountId")
    String serviceAccountId;

    public GoogleIAPConfigInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("applicationName", "applicationName");
        result.put("namespace", "namespace");
        result.put("p12FileName", "p12FileName");
        result.put("serviceAccountId", "serviceAccountId");
        return result;
    }
}
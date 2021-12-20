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
public class ModelPublicThirdPartyPlatformInfo extends Model {

    @JsonProperty("AppId")
    String appId;
    @JsonProperty("ClientId")
    String clientId;
    @JsonProperty("Environment")
    String environment;
    @JsonProperty("IsActive")
    Boolean isActive;
    @JsonProperty("PlatformId")
    String platformId;

    public ModelPublicThirdPartyPlatformInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("AppId", "appId");
        result.put("ClientId", "clientId");
        result.put("Environment", "environment");
        result.put("IsActive", "isActive");
        result.put("PlatformId", "platformId");
        return result;
    }
}
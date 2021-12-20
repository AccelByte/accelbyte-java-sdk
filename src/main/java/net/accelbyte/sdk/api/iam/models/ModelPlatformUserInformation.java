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
public class ModelPlatformUserInformation extends Model {

    @JsonProperty("DisplayName")
    String displayName;
    @JsonProperty("EmailAddress")
    String emailAddress;
    @JsonProperty("LinkedAt")
    String linkedAt;
    @JsonProperty("Namespace")
    String namespace;
    @JsonProperty("PlatformID")
    String platformID;
    @JsonProperty("PlatformUserID")
    String platformUserID;
    @JsonProperty("XUID")
    String xuid;

    public ModelPlatformUserInformation createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("DisplayName", "displayName");
        result.put("EmailAddress", "emailAddress");
        result.put("LinkedAt", "linkedAt");
        result.put("Namespace", "namespace");
        result.put("PlatformID", "platformID");
        result.put("PlatformUserID", "platformUserID");
        result.put("XUID", "xuid");
        return result;
    }
}
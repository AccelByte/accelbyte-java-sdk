package net.accelbyte.sdk.api.iam.models;

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
public class ModelPlatformUserInformation extends Model {

    @JsonProperty("DisplayName")
    private String displayName;

    @JsonProperty("EmailAddress")
    private String emailAddress;

    @JsonProperty("LinkedAt")
    private String linkedAt;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("PlatformID")
    private String platformID;

    @JsonProperty("PlatformUserID")
    private String platformUserID;

    @JsonProperty("XUID")
    private String xuid;

    public ModelPlatformUserInformation createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelPlatformUserInformation> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelPlatformUserInformation>>() {});
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
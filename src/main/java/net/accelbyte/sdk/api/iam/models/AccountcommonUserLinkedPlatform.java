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
public class AccountcommonUserLinkedPlatform extends Model {

    @JsonProperty("DisplayName")
    String displayName;
    @JsonProperty("EmailAddress")
    String emailAddress;
    @JsonProperty("LinkedAt")
    String linkedAt;
    @JsonProperty("Namespace")
    String namespace;
    @JsonProperty("OriginNamespace")
    String originNamespace;
    @JsonProperty("PlatformId")
    String platformId;
    @JsonProperty("PlatformUserId")
    String platformUserId;
    @JsonProperty("UserId")
    String userId;
    @JsonProperty("XUID")
    String xuid;

    public AccountcommonUserLinkedPlatform createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("DisplayName", "displayName");
        result.put("EmailAddress", "emailAddress");
        result.put("LinkedAt", "linkedAt");
        result.put("Namespace", "namespace");
        result.put("OriginNamespace", "originNamespace");
        result.put("PlatformId", "platformId");
        result.put("PlatformUserId", "platformUserId");
        result.put("UserId", "userId");
        result.put("XUID", "xuid");
        return result;
    }
}
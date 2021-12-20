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
public class AccountcommonUserLinkedPlatformV3 extends Model {

    @JsonProperty("accountGroup")
    String accountGroup;
    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("emailAddress")
    String emailAddress;
    @JsonProperty("linkedAt")
    String linkedAt;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("originNamespace")
    String originNamespace;
    @JsonProperty("platformId")
    String platformId;
    @JsonProperty("platformUserId")
    String platformUserId;
    @JsonProperty("userId")
    String userId;

    public AccountcommonUserLinkedPlatformV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("accountGroup", "accountGroup");
        result.put("displayName", "displayName");
        result.put("emailAddress", "emailAddress");
        result.put("linkedAt", "linkedAt");
        result.put("namespace", "namespace");
        result.put("originNamespace", "originNamespace");
        result.put("platformId", "platformId");
        result.put("platformUserId", "platformUserId");
        result.put("userId", "userId");
        return result;
    }
}
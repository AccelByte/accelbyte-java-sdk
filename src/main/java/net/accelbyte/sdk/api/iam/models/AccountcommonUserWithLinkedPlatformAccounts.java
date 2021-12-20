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
public class AccountcommonUserWithLinkedPlatformAccounts extends Model {

    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("emailAddress")
    String emailAddress;
    @JsonProperty("linkedPlatforms")
    List<AccountcommonPlatformAccount> linkedPlatforms;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("userId")
    String userId;

    public AccountcommonUserWithLinkedPlatformAccounts createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("displayName", "displayName");
        result.put("emailAddress", "emailAddress");
        result.put("linkedPlatforms", "linkedPlatforms");
        result.put("namespace", "namespace");
        result.put("userId", "userId");
        return result;
    }
}
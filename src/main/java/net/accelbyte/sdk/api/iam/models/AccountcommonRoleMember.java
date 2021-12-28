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
public class AccountcommonRoleMember extends Model {

    @JsonProperty("DisplayName")
    private String displayName;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("UserId")
    private String userId;

    public AccountcommonRoleMember createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<AccountcommonRoleMember> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AccountcommonRoleMember>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("DisplayName", "displayName");
        result.put("Namespace", "namespace");
        result.put("UserId", "userId");
        return result;
    }
}
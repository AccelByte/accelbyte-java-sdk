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
public class AccountCreateUserResponseV4 extends Model {

    @JsonProperty("authType")
    String authType;
    @JsonProperty("country")
    String country;
    @JsonProperty("dateOfBirth")
    String dateOfBirth;
    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("emailAddress")
    String emailAddress;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("username")
    String username;

    public AccountCreateUserResponseV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("authType", "authType");
        result.put("country", "country");
        result.put("dateOfBirth", "dateOfBirth");
        result.put("displayName", "displayName");
        result.put("emailAddress", "emailAddress");
        result.put("namespace", "namespace");
        result.put("userId", "userId");
        result.put("username", "username");
        return result;
    }
}
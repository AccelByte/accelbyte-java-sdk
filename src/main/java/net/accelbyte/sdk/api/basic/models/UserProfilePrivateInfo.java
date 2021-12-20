package net.accelbyte.sdk.api.basic.models;

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
public class UserProfilePrivateInfo extends Model {

    @JsonProperty("avatarLargeUrl")
    String avatarLargeUrl;
    @JsonProperty("avatarSmallUrl")
    String avatarSmallUrl;
    @JsonProperty("avatarUrl")
    String avatarUrl;
    @JsonProperty("customAttributes")
    Map<String, ?> customAttributes;
    @JsonProperty("dateOfBirth")
    String dateOfBirth;
    @JsonProperty("firstName")
    String firstName;
    @JsonProperty("language")
    String language;
    @JsonProperty("lastName")
    String lastName;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("privateCustomAttributes")
    Map<String, ?> privateCustomAttributes;
    @JsonProperty("status")
    String status;
    @JsonProperty("timeZone")
    String timeZone;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("zipCode")
    String zipCode;

    public UserProfilePrivateInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("avatarLargeUrl", "avatarLargeUrl");
        result.put("avatarSmallUrl", "avatarSmallUrl");
        result.put("avatarUrl", "avatarUrl");
        result.put("customAttributes", "customAttributes");
        result.put("dateOfBirth", "dateOfBirth");
        result.put("firstName", "firstName");
        result.put("language", "language");
        result.put("lastName", "lastName");
        result.put("namespace", "namespace");
        result.put("privateCustomAttributes", "privateCustomAttributes");
        result.put("status", "status");
        result.put("timeZone", "timeZone");
        result.put("userId", "userId");
        result.put("zipCode", "zipCode");
        return result;
    }
}
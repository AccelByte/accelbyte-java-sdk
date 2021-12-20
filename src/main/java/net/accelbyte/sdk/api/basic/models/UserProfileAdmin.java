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
public class UserProfileAdmin extends Model {

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
    @JsonProperty("status")
    String status;
    @JsonProperty("timeZone")
    String timeZone;
    @JsonProperty("zipCode")
    String zipCode;

    public UserProfileAdmin createFromJson(String json) throws JsonProcessingException {
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
        result.put("status", "status");
        result.put("timeZone", "timeZone");
        result.put("zipCode", "zipCode");
        return result;
    }
}
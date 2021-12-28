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
public class AccountUserResponseV4 extends Model {

    @JsonProperty("authType")
    private String authType;

    @JsonProperty("bans")
    private List<AccountUserActiveBanResponseV4> bans;

    @JsonProperty("country")
    private String country;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("dateOfBirth")
    private String dateOfBirth;

    @JsonProperty("deletionStatus")
    private Boolean deletionStatus;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("emailAddress")
    private String emailAddress;

    @JsonProperty("emailVerified")
    private Boolean emailVerified;

    @JsonProperty("enabled")
    private Boolean enabled;

    @JsonProperty("lastDateOfBirthChangedTime")
    private String lastDateOfBirthChangedTime;

    @JsonProperty("lastEnabledChangedTime")
    private String lastEnabledChangedTime;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("newEmailAddress")
    private String newEmailAddress;

    @JsonProperty("oldEmailAddress")
    private String oldEmailAddress;

    @JsonProperty("permissions")
    private List<AccountUserPermissionsResponseV4> permissions;

    @JsonProperty("phoneNumber")
    private String phoneNumber;

    @JsonProperty("phoneVerified")
    private Boolean phoneVerified;

    @JsonProperty("platformId")
    private String platformId;

    @JsonProperty("platformUserId")
    private String platformUserId;

    @JsonProperty("roles")
    private List<String> roles;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("username")
    private String username;

    public AccountUserResponseV4 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<AccountUserResponseV4> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AccountUserResponseV4>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("authType", "authType");
        result.put("bans", "bans");
        result.put("country", "country");
        result.put("createdAt", "createdAt");
        result.put("dateOfBirth", "dateOfBirth");
        result.put("deletionStatus", "deletionStatus");
        result.put("displayName", "displayName");
        result.put("emailAddress", "emailAddress");
        result.put("emailVerified", "emailVerified");
        result.put("enabled", "enabled");
        result.put("lastDateOfBirthChangedTime", "lastDateOfBirthChangedTime");
        result.put("lastEnabledChangedTime", "lastEnabledChangedTime");
        result.put("namespace", "namespace");
        result.put("newEmailAddress", "newEmailAddress");
        result.put("oldEmailAddress", "oldEmailAddress");
        result.put("permissions", "permissions");
        result.put("phoneNumber", "phoneNumber");
        result.put("phoneVerified", "phoneVerified");
        result.put("platformId", "platformId");
        result.put("platformUserId", "platformUserId");
        result.put("roles", "roles");
        result.put("userId", "userId");
        result.put("username", "username");
        return result;
    }
}
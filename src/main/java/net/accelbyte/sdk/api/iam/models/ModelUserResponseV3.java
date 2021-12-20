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
public class ModelUserResponseV3 extends Model {

    @JsonProperty("authType")
    String authType;
    @JsonProperty("bans")
    List<ModelUserActiveBanResponseV3> bans;
    @JsonProperty("country")
    String country;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("dateOfBirth")
    String dateOfBirth;
    @JsonProperty("deletionStatus")
    Boolean deletionStatus;
    @JsonProperty("displayName")
    String displayName;
    @JsonProperty("emailAddress")
    String emailAddress;
    @JsonProperty("emailVerified")
    Boolean emailVerified;
    @JsonProperty("enabled")
    Boolean enabled;
    @JsonProperty("lastDateOfBirthChangedTime")
    String lastDateOfBirthChangedTime;
    @JsonProperty("lastEnabledChangedTime")
    String lastEnabledChangedTime;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("namespaceRoles")
    List<AccountcommonNamespaceRole> namespaceRoles;
    @JsonProperty("newEmailAddress")
    String newEmailAddress;
    @JsonProperty("oldEmailAddress")
    String oldEmailAddress;
    @JsonProperty("permissions")
    List<ModelUserPermissionsResponseV3> permissions;
    @JsonProperty("phoneNumber")
    String phoneNumber;
    @JsonProperty("phoneVerified")
    Boolean phoneVerified;
    @JsonProperty("platformAvatarUrl")
    String platformAvatarUrl;
    @JsonProperty("platformDisplayName")
    String platformDisplayName;
    @JsonProperty("platformId")
    String platformId;
    @JsonProperty("platformUserId")
    String platformUserId;
    @JsonProperty("roles")
    List<String> roles;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("userName")
    String userName;

    public ModelUserResponseV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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
        result.put("namespaceRoles", "namespaceRoles");
        result.put("newEmailAddress", "newEmailAddress");
        result.put("oldEmailAddress", "oldEmailAddress");
        result.put("permissions", "permissions");
        result.put("phoneNumber", "phoneNumber");
        result.put("phoneVerified", "phoneVerified");
        result.put("platformAvatarUrl", "platformAvatarUrl");
        result.put("platformDisplayName", "platformDisplayName");
        result.put("platformId", "platformId");
        result.put("platformUserId", "platformUserId");
        result.put("roles", "roles");
        result.put("userId", "userId");
        result.put("userName", "userName");
        return result;
    }
}
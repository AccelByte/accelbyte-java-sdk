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
public class ModelUserResponse extends Model {

    @JsonProperty("AuthType")
    String authType;
    @JsonProperty("Bans")
    List<ModelUserActiveBanResponse> bans;
    @JsonProperty("Country")
    String country;
    @JsonProperty("CreatedAt")
    String createdAt;
    @JsonProperty("DateOfBirth")
    String dateOfBirth;
    @JsonProperty("DeletionStatus")
    Boolean deletionStatus;
    @JsonProperty("DisplayName")
    String displayName;
    @JsonProperty("EmailAddress")
    String emailAddress;
    @JsonProperty("EmailVerified")
    Boolean emailVerified;
    @JsonProperty("Enabled")
    Boolean enabled;
    @JsonProperty("LastDateOfBirthChangedTime")
    String lastDateOfBirthChangedTime;
    @JsonProperty("LastEnabledChangedTime")
    String lastEnabledChangedTime;
    @JsonProperty("LoginId")
    String loginId;
    @JsonProperty("Namespace")
    String namespace;
    @JsonProperty("NamespaceRoles")
    List<AccountcommonNamespaceRole> namespaceRoles;
    @JsonProperty("NewEmailAddress")
    String newEmailAddress;
    @JsonProperty("OldEmailAddress")
    String oldEmailAddress;
    @JsonProperty("Permissions")
    List<AccountcommonPermission> permissions;
    @JsonProperty("PhoneNumber")
    String phoneNumber;
    @JsonProperty("PhoneVerified")
    Boolean phoneVerified;
    @JsonProperty("PlatformId")
    String platformId;
    @JsonProperty("PlatformUserId")
    String platformUserId;
    @JsonProperty("Roles")
    List<String> roles;
    @JsonProperty("UserId")
    String userId;
    @JsonProperty("Username")
    String username;
    @JsonProperty("XUID")
    String xuid;

    public ModelUserResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("AuthType", "authType");
        result.put("Bans", "bans");
        result.put("Country", "country");
        result.put("CreatedAt", "createdAt");
        result.put("DateOfBirth", "dateOfBirth");
        result.put("DeletionStatus", "deletionStatus");
        result.put("DisplayName", "displayName");
        result.put("EmailAddress", "emailAddress");
        result.put("EmailVerified", "emailVerified");
        result.put("Enabled", "enabled");
        result.put("LastDateOfBirthChangedTime", "lastDateOfBirthChangedTime");
        result.put("LastEnabledChangedTime", "lastEnabledChangedTime");
        result.put("LoginId", "loginId");
        result.put("Namespace", "namespace");
        result.put("NamespaceRoles", "namespaceRoles");
        result.put("NewEmailAddress", "newEmailAddress");
        result.put("OldEmailAddress", "oldEmailAddress");
        result.put("Permissions", "permissions");
        result.put("PhoneNumber", "phoneNumber");
        result.put("PhoneVerified", "phoneVerified");
        result.put("PlatformId", "platformId");
        result.put("PlatformUserId", "platformUserId");
        result.put("Roles", "roles");
        result.put("UserId", "userId");
        result.put("Username", "username");
        result.put("XUID", "xuid");
        return result;
    }
}
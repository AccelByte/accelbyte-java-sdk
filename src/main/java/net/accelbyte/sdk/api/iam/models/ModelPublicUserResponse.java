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
public class ModelPublicUserResponse extends Model {

    @JsonProperty("AuthType")
    String authType;
    @JsonProperty("Bans")
    List<ModelUserActiveBanResponse> bans;
    @JsonProperty("CreatedAt")
    String createdAt;
    @JsonProperty("DeletionStatus")
    Boolean deletionStatus;
    @JsonProperty("DisplayName")
    String displayName;
    @JsonProperty("EmailVerified")
    Boolean emailVerified;
    @JsonProperty("Enabled")
    Boolean enabled;
    @JsonProperty("LastEnabledChangedTime")
    String lastEnabledChangedTime;
    @JsonProperty("LoginId")
    String loginId;
    @JsonProperty("Namespace")
    String namespace;
    @JsonProperty("NamespaceRoles")
    List<AccountcommonNamespaceRole> namespaceRoles;
    @JsonProperty("Permissions")
    List<AccountcommonPermission> permissions;
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

    public ModelPublicUserResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("AuthType", "authType");
        result.put("Bans", "bans");
        result.put("CreatedAt", "createdAt");
        result.put("DeletionStatus", "deletionStatus");
        result.put("DisplayName", "displayName");
        result.put("EmailVerified", "emailVerified");
        result.put("Enabled", "enabled");
        result.put("LastEnabledChangedTime", "lastEnabledChangedTime");
        result.put("LoginId", "loginId");
        result.put("Namespace", "namespace");
        result.put("NamespaceRoles", "namespaceRoles");
        result.put("Permissions", "permissions");
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
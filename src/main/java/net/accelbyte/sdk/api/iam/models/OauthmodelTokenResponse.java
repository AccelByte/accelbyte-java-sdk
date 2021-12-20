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
public class OauthmodelTokenResponse extends Model {

    @JsonProperty("access_token")
    String accessToken;
    @JsonProperty("bans")
    List<AccountcommonJWTBanV3> bans;
    @JsonProperty("display_name")
    String displayName;
    @JsonProperty("expires_in")
    Integer expiresIn;
    @JsonProperty("is_comply")
    Boolean isComply;
    @JsonProperty("jflgs")
    Integer jflgs;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("namespace_roles")
    List<AccountcommonNamespaceRole> namespaceRoles;
    @JsonProperty("permissions")
    List<AccountcommonPermission> permissions;
    @JsonProperty("platform_id")
    String platformId;
    @JsonProperty("platform_user_id")
    String platformUserId;
    @JsonProperty("refresh_token")
    String refreshToken;
    @JsonProperty("roles")
    List<String> roles;
    @JsonProperty("token_type")
    String tokenType;
    @JsonProperty("user_id")
    String userId;

    public OauthmodelTokenResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("access_token", "accessToken");
        result.put("bans", "bans");
        result.put("display_name", "displayName");
        result.put("expires_in", "expiresIn");
        result.put("is_comply", "isComply");
        result.put("jflgs", "jflgs");
        result.put("namespace", "namespace");
        result.put("namespace_roles", "namespaceRoles");
        result.put("permissions", "permissions");
        result.put("platform_id", "platformId");
        result.put("platform_user_id", "platformUserId");
        result.put("refresh_token", "refreshToken");
        result.put("roles", "roles");
        result.put("token_type", "tokenType");
        result.put("user_id", "userId");
        return result;
    }
}
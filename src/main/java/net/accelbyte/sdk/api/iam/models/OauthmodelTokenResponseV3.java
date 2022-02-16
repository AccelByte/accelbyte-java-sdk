/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class OauthmodelTokenResponseV3 extends Model {

    @JsonProperty("access_token")
    private String accessToken;

    @JsonProperty("bans")
    private List<AccountcommonJWTBanV3> bans;

    @JsonProperty("display_name")
    private String displayName;

    @JsonProperty("expires_in")
    private Integer expiresIn;

    @JsonProperty("is_comply")
    private Boolean isComply;

    @JsonProperty("jflgs")
    private Integer jflgs;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("namespace_roles")
    private List<AccountcommonNamespaceRole> namespaceRoles;

    @JsonProperty("permissions")
    private List<AccountcommonPermissionV3> permissions;

    @JsonProperty("platform_id")
    private String platformId;

    @JsonProperty("platform_user_id")
    private String platformUserId;

    @JsonProperty("refresh_expires_in")
    private Integer refreshExpiresIn;

    @JsonProperty("refresh_token")
    private String refreshToken;

    @JsonProperty("roles")
    private List<String> roles;

    @JsonProperty("scope")
    private String scope;

    @JsonProperty("token_type")
    private String tokenType;

    @JsonProperty("user_id")
    private String userId;

    @JsonProperty("xuid")
    private String xuid;

    @JsonIgnore
    public OauthmodelTokenResponseV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<OauthmodelTokenResponseV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<OauthmodelTokenResponseV3>>() {});
    }

    @JsonIgnore
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
        result.put("refresh_expires_in", "refreshExpiresIn");
        result.put("refresh_token", "refreshToken");
        result.put("roles", "roles");
        result.put("scope", "scope");
        result.put("token_type", "tokenType");
        result.put("user_id", "userId");
        result.put("xuid", "xuid");
        return result;
    }
}
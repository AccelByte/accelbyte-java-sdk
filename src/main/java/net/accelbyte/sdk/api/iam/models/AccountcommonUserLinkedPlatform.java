/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AccountcommonUserLinkedPlatform extends Model {

    @JsonProperty("DisplayName")
    private String displayName;

    @JsonProperty("EmailAddress")
    private String emailAddress;

    @JsonProperty("LinkedAt")
    private String linkedAt;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("OriginNamespace")
    private String originNamespace;

    @JsonProperty("PlatformId")
    private String platformId;

    @JsonProperty("PlatformUserId")
    private String platformUserId;

    @JsonProperty("UserId")
    private String userId;

    @JsonProperty("XUID")
    private String xuid;



    @JsonIgnore
    public AccountcommonUserLinkedPlatform createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<AccountcommonUserLinkedPlatform> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<AccountcommonUserLinkedPlatform>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("DisplayName", "displayName");
        result.put("EmailAddress", "emailAddress");
        result.put("LinkedAt", "linkedAt");
        result.put("Namespace", "namespace");
        result.put("OriginNamespace", "originNamespace");
        result.put("PlatformId", "platformId");
        result.put("PlatformUserId", "platformUserId");
        result.put("UserId", "userId");
        result.put("XUID", "xuid");
        return result;
    }
    
    public static class AccountcommonUserLinkedPlatformBuilder {
        
    }
}
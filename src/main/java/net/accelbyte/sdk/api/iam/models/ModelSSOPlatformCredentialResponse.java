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
public class ModelSSOPlatformCredentialResponse extends Model {

    @JsonProperty("acsUrl")
    private String acsUrl;

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("federationMetadataUrl")
    private String federationMetadataUrl;

    @JsonProperty("isActive")
    private Boolean isActive;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("platformId")
    private String platformId;

    @JsonProperty("redirectUri")
    private String redirectUri;

    @JsonProperty("secret")
    private String secret;

    @JsonProperty("ssoUrl")
    private String ssoUrl;

    @JsonProperty("truncatedApiKey")
    private String truncatedApiKey;



    @JsonIgnore
    public ModelSSOPlatformCredentialResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelSSOPlatformCredentialResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelSSOPlatformCredentialResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("acsUrl", "acsUrl");
        result.put("appId", "appId");
        result.put("federationMetadataUrl", "federationMetadataUrl");
        result.put("isActive", "isActive");
        result.put("namespace", "namespace");
        result.put("platformId", "platformId");
        result.put("redirectUri", "redirectUri");
        result.put("secret", "secret");
        result.put("ssoUrl", "ssoUrl");
        result.put("truncatedApiKey", "truncatedApiKey");
        return result;
    }
    
    public static class ModelSSOPlatformCredentialResponseBuilder {
        
    }
}
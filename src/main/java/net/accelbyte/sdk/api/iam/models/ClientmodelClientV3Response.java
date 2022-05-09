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
public class ClientmodelClientV3Response extends Model {

    @JsonProperty("audiences")
    private List<String> audiences;

    @JsonProperty("baseUri")
    private String baseUri;

    @JsonProperty("clientId")
    private String clientId;

    @JsonProperty("clientName")
    private String clientName;

    @JsonProperty("clientPermissions")
    private List<AccountcommonPermissionV3> clientPermissions;

    @JsonProperty("clientPlatform")
    private String clientPlatform;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("modifiedAt")
    private String modifiedAt;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("oauthClientType")
    private String oauthClientType;

    @JsonProperty("redirectUri")
    private String redirectUri;

    @JsonProperty("scopes")
    private List<String> scopes;



    @JsonIgnore
    public ClientmodelClientV3Response createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ClientmodelClientV3Response> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ClientmodelClientV3Response>>() {});
    }

    
}
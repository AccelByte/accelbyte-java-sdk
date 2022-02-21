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
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ClientmodelClientCreationResponse extends Model {

    @JsonProperty("ClientId")
    private String clientId;

    @JsonProperty("ClientName")
    private String clientName;

    @JsonProperty("ClientPermissions")
    private List<AccountcommonPermission> clientPermissions;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("RedirectUri")
    private String redirectUri;

    @JsonIgnore
    public ClientmodelClientCreationResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ClientmodelClientCreationResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ClientmodelClientCreationResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ClientId", "clientId");
        result.put("ClientName", "clientName");
        result.put("ClientPermissions", "clientPermissions");
        result.put("Namespace", "namespace");
        result.put("RedirectUri", "redirectUri");
        return result;
    }
}
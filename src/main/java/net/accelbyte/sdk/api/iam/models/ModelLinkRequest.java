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
public class ModelLinkRequest extends Model {

    @JsonProperty("client_id")
    private String clientId;

    @JsonProperty("error")
    private RestErrorResponse error;

    @JsonProperty("expiration")
    private Integer expiration;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("operation_name")
    private String operationName;

    @JsonProperty("payload")
    private Map<String, ?> payload;

    @JsonProperty("redirect_uri")
    private String redirectUri;

    @JsonProperty("request_id")
    private String requestId;

    @JsonProperty("status")
    private String status;



    @JsonIgnore
    public ModelLinkRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelLinkRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelLinkRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("client_id", "clientId");
        result.put("error", "error");
        result.put("expiration", "expiration");
        result.put("namespace", "namespace");
        result.put("operation_name", "operationName");
        result.put("payload", "payload");
        result.put("redirect_uri", "redirectUri");
        result.put("request_id", "requestId");
        result.put("status", "status");
        return result;
    }
    
    public static class ModelLinkRequestBuilder {
        
    }
}
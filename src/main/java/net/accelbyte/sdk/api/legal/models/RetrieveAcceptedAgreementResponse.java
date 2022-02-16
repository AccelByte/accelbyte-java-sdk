/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.legal.models;

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
public class RetrieveAcceptedAgreementResponse extends Model {

    @JsonProperty("countryCode")
    private String countryCode;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("displayVersion")
    private String displayVersion;

    @JsonProperty("id")
    private String id;

    @JsonProperty("isAccepted")
    private Boolean isAccepted;

    @JsonProperty("localizedPolicyVersion")
    private LocalizedPolicyVersionObject localizedPolicyVersion;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("policyId")
    private String policyId;

    @JsonProperty("policyName")
    private String policyName;

    @JsonProperty("policyType")
    private String policyType;

    @JsonProperty("signingDate")
    private String signingDate;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    @JsonIgnore
    public RetrieveAcceptedAgreementResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RetrieveAcceptedAgreementResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RetrieveAcceptedAgreementResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("countryCode", "countryCode");
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("displayVersion", "displayVersion");
        result.put("id", "id");
        result.put("isAccepted", "isAccepted");
        result.put("localizedPolicyVersion", "localizedPolicyVersion");
        result.put("namespace", "namespace");
        result.put("policyId", "policyId");
        result.put("policyName", "policyName");
        result.put("policyType", "policyType");
        result.put("signingDate", "signingDate");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}
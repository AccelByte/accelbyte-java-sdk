/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.models;

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
public class RetrieveUserEligibilitiesResponse extends Model {

    @JsonProperty("baseUrls")
    private List<String> baseUrls;

    @JsonProperty("countryCode")
    private String countryCode;

    @JsonProperty("countryGroupCode")
    private String countryGroupCode;

    @JsonProperty("description")
    private String description;

    @JsonProperty("isAccepted")
    private Boolean isAccepted;

    @JsonProperty("isMandatory")
    private Boolean isMandatory;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("policyId")
    private String policyId;

    @JsonProperty("policyName")
    private String policyName;

    @JsonProperty("policyType")
    private String policyType;

    @JsonProperty("policyVersions")
    private List<PolicyVersionWithLocalizedVersionObject> policyVersions;

    @JsonProperty("readableId")
    private String readableId;

    @JsonIgnore
    public RetrieveUserEligibilitiesResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RetrieveUserEligibilitiesResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RetrieveUserEligibilitiesResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("baseUrls", "baseUrls");
        result.put("countryCode", "countryCode");
        result.put("countryGroupCode", "countryGroupCode");
        result.put("description", "description");
        result.put("isAccepted", "isAccepted");
        result.put("isMandatory", "isMandatory");
        result.put("namespace", "namespace");
        result.put("policyId", "policyId");
        result.put("policyName", "policyName");
        result.put("policyType", "policyType");
        result.put("policyVersions", "policyVersions");
        result.put("readableId", "readableId");
        return result;
    }
}
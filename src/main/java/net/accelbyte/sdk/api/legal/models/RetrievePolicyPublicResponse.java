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
public class RetrievePolicyPublicResponse extends Model {

    @JsonProperty("basePolicyId")
    private String basePolicyId;

    @JsonProperty("baseUrls")
    private List<String> baseUrls;

    @JsonProperty("countryCode")
    private String countryCode;

    @JsonProperty("countryGroupCode")
    private String countryGroupCode;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("id")
    private String id;

    @JsonProperty("isDefaultOpted")
    private Boolean isDefaultOpted;

    @JsonProperty("isDefaultSelection")
    private Boolean isDefaultSelection;

    @JsonProperty("isMandatory")
    private Boolean isMandatory;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("policyName")
    private String policyName;

    @JsonProperty("policyType")
    private String policyType;

    @JsonProperty("policyVersions")
    private List<PolicyVersionWithLocalizedVersionObject> policyVersions;

    @JsonProperty("readableId")
    private String readableId;

    @JsonProperty("shouldNotifyOnUpdate")
    private Boolean shouldNotifyOnUpdate;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonIgnore
    public RetrievePolicyPublicResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RetrievePolicyPublicResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyPublicResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("basePolicyId", "basePolicyId");
        result.put("baseUrls", "baseUrls");
        result.put("countryCode", "countryCode");
        result.put("countryGroupCode", "countryGroupCode");
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("id", "id");
        result.put("isDefaultOpted", "isDefaultOpted");
        result.put("isDefaultSelection", "isDefaultSelection");
        result.put("isMandatory", "isMandatory");
        result.put("namespace", "namespace");
        result.put("policyName", "policyName");
        result.put("policyType", "policyType");
        result.put("policyVersions", "policyVersions");
        result.put("readableId", "readableId");
        result.put("shouldNotifyOnUpdate", "shouldNotifyOnUpdate");
        result.put("tags", "tags");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
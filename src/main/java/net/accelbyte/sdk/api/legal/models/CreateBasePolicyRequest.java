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
public class CreateBasePolicyRequest extends Model {

    @JsonProperty("affectedClientIds")
    private List<String> affectedClientIds;

    @JsonProperty("affectedCountries")
    private List<String> affectedCountries;

    @JsonProperty("basePolicyName")
    private String basePolicyName;

    @JsonProperty("description")
    private String description;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("typeId")
    private String typeId;

    @JsonIgnore
    public CreateBasePolicyRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<CreateBasePolicyRequest> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<CreateBasePolicyRequest>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("affectedClientIds", "affectedClientIds");
        result.put("affectedCountries", "affectedCountries");
        result.put("basePolicyName", "basePolicyName");
        result.put("description", "description");
        result.put("namespace", "namespace");
        result.put("tags", "tags");
        result.put("typeId", "typeId");
        return result;
    }
}
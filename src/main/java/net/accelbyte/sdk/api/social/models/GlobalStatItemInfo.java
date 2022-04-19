/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

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
public class GlobalStatItemInfo extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("statCode")
    private String statCode;

    @JsonProperty("statName")
    private String statName;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("value")
    private Float value;

    @JsonIgnore
    public GlobalStatItemInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<GlobalStatItemInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<GlobalStatItemInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("namespace", "namespace");
        result.put("statCode", "statCode");
        result.put("statName", "statName");
        result.put("tags", "tags");
        result.put("updatedAt", "updatedAt");
        result.put("value", "value");
        return result;
    }
}
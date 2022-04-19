/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class LocalizedSeasonInfo extends Model {

    @JsonProperty("autoClaim")
    private Boolean autoClaim;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("end")
    private String end;

    @JsonProperty("id")
    private String id;

    @JsonProperty("images")
    private List<Image> images;

    @JsonProperty("language")
    private String language;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("passCodes")
    private List<String> passCodes;

    @JsonProperty("passes")
    private List<LocalizedPassInfo> passes;

    @JsonProperty("publishedAt")
    private String publishedAt;

    @JsonProperty("rewards")
    private Map<String, RewardInfo> rewards;

    @JsonProperty("start")
    private String start;

    @JsonProperty("status")
    private String status;

    @JsonProperty("tierItemId")
    private String tierItemId;

    @JsonProperty("tiers")
    private List<Tier> tiers;

    @JsonProperty("title")
    private String title;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonIgnore
    public LocalizedSeasonInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<LocalizedSeasonInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<LocalizedSeasonInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("autoClaim", "autoClaim");
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("end", "end");
        result.put("id", "id");
        result.put("images", "images");
        result.put("language", "language");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("passCodes", "passCodes");
        result.put("passes", "passes");
        result.put("publishedAt", "publishedAt");
        result.put("rewards", "rewards");
        result.put("start", "start");
        result.put("status", "status");
        result.put("tierItemId", "tierItemId");
        result.put("tiers", "tiers");
        result.put("title", "title");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
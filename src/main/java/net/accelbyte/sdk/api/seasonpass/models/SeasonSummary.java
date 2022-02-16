/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class SeasonSummary extends Model {

    @JsonProperty("end")
    private String end;

    @JsonProperty("id")
    private String id;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("passCodes")
    private List<String> passCodes;

    @JsonProperty("previous")
    private SeasonSummary previous;

    @JsonProperty("publishedAt")
    private String publishedAt;

    @JsonProperty("start")
    private String start;

    @JsonProperty("status")
    private String status;

    @JsonIgnore
    public SeasonSummary createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<SeasonSummary> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<SeasonSummary>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("end", "end");
        result.put("id", "id");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("passCodes", "passCodes");
        result.put("previous", "previous");
        result.put("publishedAt", "publishedAt");
        result.put("start", "start");
        result.put("status", "status");
        return result;
    }
}
/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class FullAppInfo extends Model {

    @JsonProperty("carousel")
    private List<Slide> carousel;

    @JsonProperty("developer")
    private String developer;

    @JsonProperty("forumUrl")
    private String forumUrl;

    @JsonProperty("genres")
    private List<String> genres;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("localizations")
    private Map<String, AppLocalization> localizations;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("platformRequirements")
    private Map<String, List<Requirement>> platformRequirements;

    @JsonProperty("platforms")
    private List<String> platforms;

    @JsonProperty("players")
    private List<String> players;

    @JsonProperty("primaryGenre")
    private String primaryGenre;

    @JsonProperty("publisher")
    private String publisher;

    @JsonProperty("releaseDate")
    private String releaseDate;

    @JsonProperty("websiteUrl")
    private String websiteUrl;

    @JsonIgnore
    public FullAppInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<FullAppInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<FullAppInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("carousel", "carousel");
        result.put("developer", "developer");
        result.put("forumUrl", "forumUrl");
        result.put("genres", "genres");
        result.put("itemId", "itemId");
        result.put("localizations", "localizations");
        result.put("namespace", "namespace");
        result.put("platformRequirements", "platformRequirements");
        result.put("platforms", "platforms");
        result.put("players", "players");
        result.put("primaryGenre", "primaryGenre");
        result.put("publisher", "publisher");
        result.put("releaseDate", "releaseDate");
        result.put("websiteUrl", "websiteUrl");
        return result;
    }
}
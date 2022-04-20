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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class LocalizedPassInfo extends Model {

    @JsonProperty("autoEnroll")
    private Boolean autoEnroll;

    @JsonProperty("code")
    private String code;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("displayOrder")
    private String displayOrder;

    @JsonProperty("images")
    private List<Image> images;

    @JsonProperty("language")
    private String language;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("passItemId")
    private String passItemId;

    @JsonProperty("seasonId")
    private String seasonId;

    @JsonProperty("title")
    private String title;

    @JsonProperty("updatedAt")
    private String updatedAt;



    @JsonIgnore
    public LocalizedPassInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<LocalizedPassInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<LocalizedPassInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("autoEnroll", "autoEnroll");
        result.put("code", "code");
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("displayOrder", "displayOrder");
        result.put("images", "images");
        result.put("language", "language");
        result.put("namespace", "namespace");
        result.put("passItemId", "passItemId");
        result.put("seasonId", "seasonId");
        result.put("title", "title");
        result.put("updatedAt", "updatedAt");
        return result;
    }
    
    public static class LocalizedPassInfoBuilder {
        
    }
}
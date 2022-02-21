/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.ugc.models;

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
public class ModelsCreateContentResponse extends Model {

    @JsonProperty("channelId")
    private String channelId;

    @JsonProperty("contentType")
    private String contentType;

    @JsonProperty("createdTime")
    private String createdTime;

    @JsonProperty("creatorName")
    private String creatorName;

    @JsonProperty("fileExtension")
    private String fileExtension;

    @JsonProperty("id")
    private String id;

    @JsonProperty("isHidden")
    private Boolean isHidden;

    @JsonProperty("isOfficial")
    private Boolean isOfficial;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("payloadURL")
    private List<ModelsPayloadURL> payloadURL;

    @JsonProperty("preview")
    private String preview;

    @JsonProperty("shareCode")
    private String shareCode;

    @JsonProperty("subType")
    private String subType;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("type")
    private String type;

    @JsonProperty("userId")
    private String userId;

    @JsonIgnore
    public ModelsCreateContentResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsCreateContentResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCreateContentResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("channelId", "channelId");
        result.put("contentType", "contentType");
        result.put("createdTime", "createdTime");
        result.put("creatorName", "creatorName");
        result.put("fileExtension", "fileExtension");
        result.put("id", "id");
        result.put("isHidden", "isHidden");
        result.put("isOfficial", "isOfficial");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("payloadURL", "payloadURL");
        result.put("preview", "preview");
        result.put("shareCode", "shareCode");
        result.put("subType", "subType");
        result.put("tags", "tags");
        result.put("type", "type");
        result.put("userId", "userId");
        return result;
    }
}
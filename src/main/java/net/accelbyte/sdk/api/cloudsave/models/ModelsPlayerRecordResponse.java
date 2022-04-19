/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.models;

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
public class ModelsPlayerRecordResponse extends Model {

    @JsonProperty("created_at")
    private String createdAt;

    @JsonProperty("is_public")
    private Boolean isPublic;

    @JsonProperty("key")
    private String key;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("set_by")
    private String setBy;

    @JsonProperty("updated_at")
    private String updatedAt;

    @JsonProperty("user_id")
    private String userId;

    @JsonProperty("value")
    private Map<String, ?> value;

    @JsonIgnore
    public ModelsPlayerRecordResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsPlayerRecordResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPlayerRecordResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("created_at", "createdAt");
        result.put("is_public", "isPublic");
        result.put("key", "key");
        result.put("namespace", "namespace");
        result.put("set_by", "setBy");
        result.put("updated_at", "updatedAt");
        result.put("user_id", "userId");
        result.put("value", "value");
        return result;
    }
}
/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserBanResponseV3 extends Model {

    @JsonProperty("ban")
    private String ban;

    @JsonProperty("banId")
    private String banId;

    @JsonProperty("bannedBy")
    private AccountcommonBannedByV3 bannedBy;

    @JsonProperty("comment")
    private String comment;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("disabledDate")
    private String disabledDate;

    @JsonProperty("enabled")
    private Boolean enabled;

    @JsonProperty("endDate")
    private String endDate;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("reason")
    private String reason;

    @JsonProperty("userId")
    private String userId;

    @JsonIgnore
    public ModelUserBanResponseV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserBanResponseV3> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserBanResponseV3>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("ban", "ban");
        result.put("banId", "banId");
        result.put("bannedBy", "bannedBy");
        result.put("comment", "comment");
        result.put("createdAt", "createdAt");
        result.put("disabledDate", "disabledDate");
        result.put("enabled", "enabled");
        result.put("endDate", "endDate");
        result.put("namespace", "namespace");
        result.put("reason", "reason");
        result.put("userId", "userId");
        return result;
    }
}
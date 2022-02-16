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
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class ModelUserBanResponse extends Model {

    @JsonProperty("Ban")
    private String ban;

    @JsonProperty("BanId")
    private String banId;

    @JsonProperty("BannedBy")
    private BannedBy bannedBy;

    @JsonProperty("Comment")
    private String comment;

    @JsonProperty("CreatedAt")
    private String createdAt;

    @JsonProperty("DisabledDate")
    private String disabledDate;

    @JsonProperty("Enabled")
    private Boolean enabled;

    @JsonProperty("EndDate")
    private String endDate;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("Reason")
    private String reason;

    @JsonProperty("UserId")
    private String userId;

    @JsonIgnore
    public ModelUserBanResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelUserBanResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelUserBanResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("Ban", "ban");
        result.put("BanId", "banId");
        result.put("BannedBy", "bannedBy");
        result.put("Comment", "comment");
        result.put("CreatedAt", "createdAt");
        result.put("DisabledDate", "disabledDate");
        result.put("Enabled", "enabled");
        result.put("EndDate", "endDate");
        result.put("Namespace", "namespace");
        result.put("Reason", "reason");
        result.put("UserId", "userId");
        return result;
    }
}
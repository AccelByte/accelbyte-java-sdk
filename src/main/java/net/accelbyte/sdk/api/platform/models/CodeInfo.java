/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
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
public class CodeInfo extends Model {

    @JsonProperty("acquireOrderNo")
    private String acquireOrderNo;

    @JsonProperty("acquireUserId")
    private String acquireUserId;

    @JsonProperty("batchNo")
    private Integer batchNo;

    @JsonProperty("campaignId")
    private String campaignId;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("id")
    private String id;

    @JsonProperty("items")
    private List<RedeemableItem> items;

    @JsonProperty("maxRedeemCountPerCampaignPerUser")
    private Integer maxRedeemCountPerCampaignPerUser;

    @JsonProperty("maxRedeemCountPerCode")
    private Integer maxRedeemCountPerCode;

    @JsonProperty("maxRedeemCountPerCodePerUser")
    private Integer maxRedeemCountPerCodePerUser;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("redeemEnd")
    private String redeemEnd;

    @JsonProperty("redeemStart")
    private String redeemStart;

    @JsonProperty("redeemType")
    private String redeemType;

    @JsonProperty("redeemedCount")
    private Integer redeemedCount;

    @JsonProperty("remainder")
    private Integer remainder;

    @JsonProperty("status")
    private String status;

    @JsonProperty("type")
    private String type;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("value")
    private String value;

    @JsonIgnore
    public CodeInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<CodeInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<CodeInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("acquireOrderNo", "acquireOrderNo");
        result.put("acquireUserId", "acquireUserId");
        result.put("batchNo", "batchNo");
        result.put("campaignId", "campaignId");
        result.put("createdAt", "createdAt");
        result.put("id", "id");
        result.put("items", "items");
        result.put("maxRedeemCountPerCampaignPerUser", "maxRedeemCountPerCampaignPerUser");
        result.put("maxRedeemCountPerCode", "maxRedeemCountPerCode");
        result.put("maxRedeemCountPerCodePerUser", "maxRedeemCountPerCodePerUser");
        result.put("namespace", "namespace");
        result.put("redeemEnd", "redeemEnd");
        result.put("redeemStart", "redeemStart");
        result.put("redeemType", "redeemType");
        result.put("redeemedCount", "redeemedCount");
        result.put("remainder", "remainder");
        result.put("status", "status");
        result.put("type", "type");
        result.put("updatedAt", "updatedAt");
        result.put("value", "value");
        return result;
    }
}
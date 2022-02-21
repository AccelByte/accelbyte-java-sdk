/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.lobby.models;

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
public class ModelsPartyData extends Model {

    @JsonProperty("custom_attribute")
    private Map<String, ?> customAttribute;

    @JsonProperty("invitees")
    private List<String> invitees;

    @JsonProperty("leader")
    private String leader;

    @JsonProperty("members")
    private List<String> members;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("partyId")
    private String partyId;

    @JsonProperty("updatedAt")
    private Integer updatedAt;

    @JsonIgnore
    public ModelsPartyData createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsPartyData> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPartyData>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("custom_attribute", "customAttribute");
        result.put("invitees", "invitees");
        result.put("leader", "leader");
        result.put("members", "members");
        result.put("namespace", "namespace");
        result.put("partyId", "partyId");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}
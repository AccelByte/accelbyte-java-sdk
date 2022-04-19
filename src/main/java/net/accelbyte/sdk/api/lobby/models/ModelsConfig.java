/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
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
public class ModelsConfig extends Model {

    @JsonProperty("allowInviteNonConnectedUser")
    private Boolean allowInviteNonConnectedUser;

    @JsonProperty("allowJoinPartyDuringMatchmaking")
    private Boolean allowJoinPartyDuringMatchmaking;

    @JsonProperty("autoKickOnDisconnect")
    private Boolean autoKickOnDisconnect;

    @JsonProperty("autoKickOnDisconnectDelay")
    private Integer autoKickOnDisconnectDelay;

    @JsonProperty("cancelTicketOnDisconnect")
    private Boolean cancelTicketOnDisconnect;

    @JsonProperty("chatRateLimitBurst")
    private Integer chatRateLimitBurst;

    @JsonProperty("chatRateLimitDuration")
    private Integer chatRateLimitDuration;

    @JsonProperty("concurrentUsersLimit")
    private Integer concurrentUsersLimit;

    @JsonProperty("disableInvitationOnJoinParty")
    private Boolean disableInvitationOnJoinParty;

    @JsonProperty("enableChat")
    private Boolean enableChat;

    @JsonProperty("entitlementCheck")
    private Boolean entitlementCheck;

    @JsonProperty("entitlementItemID")
    private String entitlementItemID;

    @JsonProperty("generalRateLimitBurst")
    private Integer generalRateLimitBurst;

    @JsonProperty("generalRateLimitDuration")
    private Integer generalRateLimitDuration;

    @JsonProperty("keepPresenceActivityOnDisconnect")
    private Boolean keepPresenceActivityOnDisconnect;

    @JsonProperty("maxPartyMember")
    private Integer maxPartyMember;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("profanityFilter")
    private Boolean profanityFilter;

    @JsonProperty("readyConsentTimeout")
    private Integer readyConsentTimeout;

    @JsonIgnore
    public ModelsConfig createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsConfig> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsConfig>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allowInviteNonConnectedUser", "allowInviteNonConnectedUser");
        result.put("allowJoinPartyDuringMatchmaking", "allowJoinPartyDuringMatchmaking");
        result.put("autoKickOnDisconnect", "autoKickOnDisconnect");
        result.put("autoKickOnDisconnectDelay", "autoKickOnDisconnectDelay");
        result.put("cancelTicketOnDisconnect", "cancelTicketOnDisconnect");
        result.put("chatRateLimitBurst", "chatRateLimitBurst");
        result.put("chatRateLimitDuration", "chatRateLimitDuration");
        result.put("concurrentUsersLimit", "concurrentUsersLimit");
        result.put("disableInvitationOnJoinParty", "disableInvitationOnJoinParty");
        result.put("enableChat", "enableChat");
        result.put("entitlementCheck", "entitlementCheck");
        result.put("entitlementItemID", "entitlementItemID");
        result.put("generalRateLimitBurst", "generalRateLimitBurst");
        result.put("generalRateLimitDuration", "generalRateLimitDuration");
        result.put("keepPresenceActivityOnDisconnect", "keepPresenceActivityOnDisconnect");
        result.put("maxPartyMember", "maxPartyMember");
        result.put("namespace", "namespace");
        result.put("profanityFilter", "profanityFilter");
        result.put("readyConsentTimeout", "readyConsentTimeout");
        return result;
    }
}
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
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

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
}

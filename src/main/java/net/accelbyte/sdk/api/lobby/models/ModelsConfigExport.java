/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
/*
 *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
 */
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsConfigExport extends Model {

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

  @JsonProperty("maxDSWaitTime")
  private Integer maxDSWaitTime;

  @JsonProperty("maxPartyMember")
  private Integer maxPartyMember;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("profanityFilter")
  private Boolean profanityFilter;

  @JsonProperty("readyConsentTimeout")
  private Integer readyConsentTimeout;

  @JsonIgnore
  public ModelsConfigExport createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsConfigExport> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsConfigExport>>() {});
  }
}

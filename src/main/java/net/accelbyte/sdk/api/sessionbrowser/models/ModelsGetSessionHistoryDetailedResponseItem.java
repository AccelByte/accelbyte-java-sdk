/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.models;

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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsGetSessionHistoryDetailedResponseItem extends Model {

  @JsonProperty("_id")
  private String id;

  @JsonProperty("channel")
  private String channel;

  @JsonProperty("client_version")
  private String clientVersion;

  @JsonProperty("created_at")
  private String createdAt;

  @JsonProperty("event_description")
  private String eventDescription;

  @JsonProperty("event_name")
  private String eventName;

  @JsonProperty("game_mode")
  private String gameMode;

  @JsonProperty("joinable")
  private Boolean joinable;

  @JsonProperty("joining")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsSessionPlayerJoining> joining;

  @JsonProperty("match_id")
  private String matchId;

  @JsonProperty("matching_allies")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsMatchingAlly> matchingAllies;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("party_id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String partyId;

  @JsonProperty("players")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsSessionPlayerHistory> players;

  @JsonProperty("region")
  private String region;

  @JsonProperty("removed_reason")
  private String removedReason;

  @JsonProperty("server_name")
  private String serverName;

  @JsonProperty("session_type")
  private String sessionType;

  @JsonProperty("status")
  private String status;

  @JsonProperty("user_id")
  private String userId;

  @JsonIgnore
  public ModelsGetSessionHistoryDetailedResponseItem createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsGetSessionHistoryDetailedResponseItem> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsGetSessionHistoryDetailedResponseItem>>() {});
  }
}

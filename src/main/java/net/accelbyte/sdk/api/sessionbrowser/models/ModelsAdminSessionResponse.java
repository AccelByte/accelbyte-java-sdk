/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class ModelsAdminSessionResponse extends Model {

  @JsonProperty("all_players")
  private List<String> allPlayers;

  @JsonProperty("created_at")
  private String createdAt;

  @JsonProperty("game_session_setting")
  private ModelsGameSessionSetting gameSessionSetting;

  @JsonProperty("game_version")
  private String gameVersion;

  @JsonProperty("joinable")
  private Boolean joinable;

  @JsonProperty("match")
  private ModelsMatchMaking match;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("players")
  private List<String> players;

  @JsonProperty("server")
  private ModelsServer server;

  @JsonProperty("session_id")
  private String sessionId;

  @JsonProperty("session_type")
  private String sessionType;

  @JsonProperty("spectators")
  private List<String> spectators;

  @JsonProperty("user_id")
  private String userId;

  @JsonProperty("username")
  private String username;

  @JsonIgnore
  public ModelsAdminSessionResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsAdminSessionResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsAdminSessionResponse>>() {});
  }
}

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
public class ModelsCustomGameResponse extends Model {

  @JsonProperty("all_players")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> allPlayers;

  @JsonProperty("created_at")
  private String createdAt;

  @JsonProperty("game_session_setting")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsGameSessionSetting gameSessionSetting;

  @JsonProperty("joinable")
  private Boolean joinable;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("players")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> players;

  @JsonProperty("server")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsServer server;

  @JsonProperty("session_id")
  private String sessionId;

  @JsonProperty("session_type")
  private String sessionType;

  @JsonProperty("spectators")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> spectators;

  @JsonIgnore
  public ModelsCustomGameResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsCustomGameResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsCustomGameResponse>>() {});
  }
}

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
import java.util.List;
import java.util.Map;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsMatchMaking extends Model {

  @JsonProperty("channel")
  private String channel;

  @JsonProperty("client_version")
  private String clientVersion;

  @JsonProperty("created_at")
  private String createdAt;

  @JsonProperty("deployment")
  private String deployment;

  @JsonProperty("event")
  private String event;

  @JsonProperty("game_mode")
  private String gameMode;

  @JsonProperty("joinable")
  private Boolean joinable;

  @JsonProperty("match_id")
  private String matchId;

  @JsonProperty("matching_allies")
  private List<ModelsMatchingAlly> matchingAllies;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("party_attributes")
  private Map<String, ?> partyAttributes;

  @JsonProperty("party_id")
  private String partyId;

  @JsonProperty("queued_at")
  private Integer queuedAt;

  @JsonProperty("region")
  private String region;

  @JsonProperty("server_name")
  private String serverName;

  @JsonProperty("status")
  private String status;

  @JsonIgnore
  public ModelsMatchMaking createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsMatchMaking> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsMatchMaking>>() {});
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.models;

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
public class ModelsGameSession extends Model {

  @JsonProperty("DSInformation")
  private ModelsDSInformation dsInformation;

  @JsonProperty("GameMode")
  private String gameMode;

  @JsonProperty("IsFull")
  private Boolean isFull;

  @JsonProperty("JoinType")
  private String joinType;

  @JsonProperty("Members")
  private List<ModelsUser> members;

  @JsonProperty("attributes")
  private Map<String, ?> attributes;

  @JsonProperty("backfillTicketID")
  private String backfillTicketID;

  @JsonProperty("configuration")
  private ModelsConfiguration configuration;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("id")
  private String id;

  @JsonProperty("leaderID")
  private String leaderID;

  @JsonProperty("matchPool")
  private String matchPool;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("teams")
  private List<MatchmakerTeam> teams;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("version")
  private Integer version;

  @JsonIgnore
  public ModelsGameSession createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsGameSession> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGameSession>>() {});
  }
}

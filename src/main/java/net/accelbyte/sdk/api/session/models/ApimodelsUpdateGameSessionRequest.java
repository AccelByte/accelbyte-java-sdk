/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.models;

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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ApimodelsUpdateGameSessionRequest extends Model {

  @JsonProperty("attributes")
  private Map<String, ?> attributes;

  @JsonProperty("backfillTicketID")
  private String backfillTicketID;

  @JsonProperty("clientVersion")
  private String clientVersion;

  @JsonProperty("deployment")
  private String deployment;

  @JsonProperty("inactiveTimeout")
  private Integer inactiveTimeout;

  @JsonProperty("inviteTimeout")
  private Integer inviteTimeout;

  @JsonProperty("joinability")
  private String joinability;

  @JsonProperty("matchPool")
  private String matchPool;

  @JsonProperty("maxPlayers")
  private Integer maxPlayers;

  @JsonProperty("minPlayers")
  private Integer minPlayers;

  @JsonProperty("requestedRegions")
  private List<String> requestedRegions;

  @JsonProperty("teams")
  private List<ModelsTeam> teams;

  @JsonProperty("ticketIDs")
  private List<String> ticketIDs;

  @JsonProperty("type")
  private String type;

  @JsonProperty("version")
  private Integer version;

  @JsonIgnore
  public ApimodelsUpdateGameSessionRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsUpdateGameSessionRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsUpdateGameSessionRequest>>() {});
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.models;

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
public class ApimodelsTicketObservabilityDetail extends Model {

  @JsonProperty("action")
  private String action;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("expiredAt")
  private String expiredAt;

  @JsonProperty("game_mode")
  private String gameMode;

  @JsonProperty("history")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ApimodelsTicketObservabilityHistory> history;

  @JsonProperty("lastData")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsTicketObservability lastData;

  @JsonProperty("matchId")
  private String matchId;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("party_id")
  private String partyId;

  @JsonProperty("regions")
  private String regions;

  @JsonProperty("remainingPlayersPerTicket")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<Integer> remainingPlayersPerTicket;

  @JsonProperty("remainingTickets")
  private Integer remainingTickets;

  @JsonProperty("requestedRegion")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> requestedRegion;

  @JsonProperty("ticket")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsTicket ticket;

  @JsonProperty("ticket_id")
  private String ticketId;

  @JsonProperty("timeToMatchSec")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float timeToMatchSec;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userIDs")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> userIDs;

  @JsonIgnore
  public ApimodelsTicketObservabilityDetail createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsTicketObservabilityDetail> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsTicketObservabilityDetail>>() {});
  }
}

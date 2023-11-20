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
public class MatchmakerMatchTicketRecord extends Model {

  @JsonProperty("CreatedAt")
  private String createdAt;

  @JsonProperty("IsActive")
  private Boolean isActive;

  @JsonProperty("PartySessionID")
  private String partySessionID;

  @JsonProperty("ProposedProposal")
  private MatchmakerProposedProposal proposedProposal;

  @JsonProperty("SessionID")
  private String sessionID;

  @JsonProperty("Ticket")
  private MatchmakerTicket ticket;

  @JsonProperty("TicketID")
  private String ticketID;

  @JsonProperty("UniqueTicketID")
  private String uniqueTicketID;

  @JsonIgnore
  public MatchmakerMatchTicketRecord createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<MatchmakerMatchTicketRecord> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<MatchmakerMatchTicketRecord>>() {});
  }
}

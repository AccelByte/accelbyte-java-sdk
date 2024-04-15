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
public class ModelsTicket extends Model {

  @JsonProperty("CreatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("Latencies")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, Integer> latencies;

  @JsonProperty("MatchPool")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String matchPool;

  @JsonProperty("Namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("PartySessionID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String partySessionID;

  @JsonProperty("Players")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsPlayerData> players;

  @JsonProperty("ProposedProposal")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsProposedProposal proposedProposal;

  @JsonProperty("TicketAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> ticketAttributes;

  @JsonProperty("TicketID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String ticketID;

  @JsonIgnore
  public ModelsTicket createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsTicket> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsTicket>>() {});
  }
}

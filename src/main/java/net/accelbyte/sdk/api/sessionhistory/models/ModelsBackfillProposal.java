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
public class ModelsBackfillProposal extends Model {

  @JsonProperty("AddedTickets")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsTicket> addedTickets;

  @JsonProperty("BackfillTicketID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String backfillTicketID;

  @JsonProperty("CreatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("MatchPool")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String matchPool;

  @JsonProperty("MatchSessionID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String matchSessionID;

  @JsonProperty("ProposalID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String proposalID;

  @JsonProperty("ProposedTeams")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsTeam> proposedTeams;

  @JsonIgnore
  public ModelsBackfillProposal createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsBackfillProposal> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsBackfillProposal>>() {});
  }
}

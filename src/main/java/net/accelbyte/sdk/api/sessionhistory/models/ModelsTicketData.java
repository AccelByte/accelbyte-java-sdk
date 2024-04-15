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
public class ModelsTicketData extends Model {

  @JsonProperty("action")
  private String action;

  @JsonProperty("activeAllianceRule")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsAllianceRule activeAllianceRule;

  @JsonProperty("activeMatchingRule")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsMatchingRule> activeMatchingRule;

  @JsonProperty("function")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String function;

  @JsonProperty("gameMode")
  private String gameMode;

  @JsonProperty("isBackfillMatch")
  private Boolean isBackfillMatch;

  @JsonProperty("isRuleSetFlexed")
  private Boolean isRuleSetFlexed;

  @JsonProperty("iteration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer iteration;

  @JsonProperty("matchID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String matchID;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("partyID")
  private String partyID;

  @JsonProperty("podName")
  private String podName;

  @JsonProperty("remainingPlayersPerTicket")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<Integer> remainingPlayersPerTicket;

  @JsonProperty("remainingTickets")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer remainingTickets;

  @JsonProperty("session")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsMatchmakingResult session;

  @JsonProperty("sessionTickID")
  private String sessionTickID;

  @JsonProperty("tickID")
  private Integer tickID;

  @JsonProperty("timeToMatchSec")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float timeToMatchSec;

  @JsonProperty("timestamp")
  private String timestamp;

  @JsonProperty("unbackfillReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String unbackfillReason;

  @JsonProperty("unmatchReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String unmatchReason;

  @JsonIgnore
  public ModelsTicketData createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsTicketData> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsTicketData>>() {});
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsMockTicket extends Model {

  @JsonProperty("additional_criteria")
  private Map<String, ?> additionalCriteria;

  @JsonProperty("channel")
  private String channel;

  @JsonProperty("created_at")
  private Integer createdAt;

  @JsonProperty("first_ticket_created_at")
  private Integer firstTicketCreatedAt;

  @JsonProperty("is_mock")
  private String isMock;

  @JsonProperty("is_sampled")
  private Boolean isSampled;

  @JsonProperty("latency_map")
  private Map<String, Integer> latencyMap;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("party_attributes")
  private Map<String, ?> partyAttributes;

  @JsonProperty("party_id")
  private String partyId;

  @JsonProperty("party_leader_id")
  private String partyLeaderId;

  @JsonProperty("party_members")
  private List<ModelsPartyMember> partyMembers;

  @JsonProperty("priority")
  private Integer priority;

  @JsonProperty("sampling_properties")
  private List<List<String>> samplingProperties;

  @JsonProperty("sorted_latency")
  private List<ModelsRegion> sortedLatency;

  @JsonProperty("status")
  private String status;

  @JsonProperty("ticket_id")
  private String ticketId;

  @JsonIgnore
  public ModelsMockTicket createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsMockTicket> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsMockTicket>>() {});
  }
}

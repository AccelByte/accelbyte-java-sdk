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
public class ModelsGameSession extends Model {

  @JsonProperty("Attributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> attributes;

  @JsonProperty("BackfillTicketID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String backfillTicketID;

  @JsonProperty("Code")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String code;

  @JsonProperty("Configuration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsSessionConfig configuration;

  @JsonProperty("ConfigurationName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String configurationName;

  @JsonProperty("CreatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("CreatedBy")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdBy;

  @JsonProperty("DSInformation")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsDSInformation dsInformation;

  @JsonProperty("GameMode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String gameMode;

  @JsonProperty("ID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("IsFull")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isFull;

  @JsonProperty("LeaderID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String leaderID;

  @JsonProperty("MatchPool")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String matchPool;

  @JsonProperty("Members")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsUser> members;

  @JsonProperty("Namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("ProcessingTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer processingTime;

  @JsonProperty("Teams")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsGameSessionTeam> teams;

  @JsonProperty("TicketIDs")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> ticketIDs;

  @JsonProperty("UpdatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonProperty("Version")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer version;

  @JsonProperty("isActive")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isActive;

  @JsonIgnore
  public ModelsGameSession createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsGameSession> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGameSession>>() {});
  }
}

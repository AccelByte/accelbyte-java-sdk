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
public class ModelsMatch extends Model {

  @JsonProperty("Backfill")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean backfill;

  @JsonProperty("ClientVersion")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String clientVersion;

  @JsonProperty("MatchAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> matchAttributes;

  @JsonProperty("RegionPreference")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> regionPreference;

  @JsonProperty("ServerName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String serverName;

  @JsonProperty("Teams")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsTeam> teams;

  @JsonProperty("Tickets")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsTicket> tickets;

  @JsonIgnore
  public ModelsMatch createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsMatch> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsMatch>>() {});
  }
}

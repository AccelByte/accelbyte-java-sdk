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
public class ApiMatch extends Model {

  @JsonProperty("backfill")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean backfill;

  @JsonProperty("clientVersion")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String clientVersion;

  @JsonProperty("matchAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> matchAttributes;

  @JsonProperty("regionPreference")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> regionPreference;

  @JsonProperty("serverName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String serverName;

  @JsonProperty("teams")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ApiTeam> teams;

  @JsonProperty("tickets")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ApiTicket> tickets;

  @JsonIgnore
  public ApiMatch createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiMatch> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApiMatch>>() {});
  }
}

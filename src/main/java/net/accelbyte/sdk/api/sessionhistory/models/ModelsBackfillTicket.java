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
public class ModelsBackfillTicket extends Model {

  @JsonProperty("CreatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("MatchPool")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String matchPool;

  @JsonProperty("MatchSessionID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String matchSessionID;

  @JsonProperty("MatchSessionVersion")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer matchSessionVersion;

  @JsonProperty("PartialMatch")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsMatch partialMatch;

  @JsonProperty("TicketID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String ticketID;

  @JsonIgnore
  public ModelsBackfillTicket createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsBackfillTicket> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsBackfillTicket>>() {});
  }
}

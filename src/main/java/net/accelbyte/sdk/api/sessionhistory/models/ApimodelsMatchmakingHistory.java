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
public class ApimodelsMatchmakingHistory extends Model {

  @JsonProperty("backfillProposal")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsBackfillProposal backfillProposal;

  @JsonProperty("backfillTicket")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsBackfillTicket backfillTicket;

  @JsonProperty("eventName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String eventName;

  @JsonProperty("requestedUserID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String requestedUserID;

  @JsonProperty("ticket")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsTicket ticket;

  @JsonProperty("timestamp")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String timestamp;

  @JsonProperty("unbackfillReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String unbackfillReason;

  @JsonIgnore
  public ApimodelsMatchmakingHistory createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsMatchmakingHistory> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsMatchmakingHistory>>() {});
  }
}

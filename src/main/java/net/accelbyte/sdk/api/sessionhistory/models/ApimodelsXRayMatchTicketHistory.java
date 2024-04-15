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
public class ApimodelsXRayMatchTicketHistory extends Model {

  @JsonProperty("action")
  private String action;

  @JsonProperty("match")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelsEventMatchHistory match;

  @JsonProperty("ticket")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsTicket ticket;

  @JsonProperty("timestamp")
  private String timestamp;

  @JsonIgnore
  public ApimodelsXRayMatchTicketHistory createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsXRayMatchTicketHistory> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsXRayMatchTicketHistory>>() {});
  }
}

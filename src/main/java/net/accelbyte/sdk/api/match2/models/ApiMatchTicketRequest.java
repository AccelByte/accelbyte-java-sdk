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
public class ApiMatchTicketRequest extends Model {

  @JsonProperty("attributes")
  private Map<String, ?> attributes;

  @JsonProperty("excludedSessions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> excludedSessions;

  @JsonProperty("latencies")
  private Map<String, Integer> latencies;

  @JsonProperty("matchPool")
  private String matchPool;

  @JsonProperty("sessionID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sessionID;

  @JsonProperty("storage")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> storage;

  @JsonIgnore
  public ApiMatchTicketRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiMatchTicketRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApiMatchTicketRequest>>() {});
  }
}

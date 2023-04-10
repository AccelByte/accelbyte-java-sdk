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
public class ApiBackfillGetResponse extends Model {

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("matchPool")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String matchPool;

  @JsonProperty("matchSessionID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String matchSessionID;

  @JsonProperty("partialMatch")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApiMatch partialMatch;

  @JsonProperty("ticketID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String ticketID;

  @JsonIgnore
  public ApiBackfillGetResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiBackfillGetResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApiBackfillGetResponse>>() {});
  }
}

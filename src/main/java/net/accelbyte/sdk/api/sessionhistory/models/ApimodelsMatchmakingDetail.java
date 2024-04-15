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
public class ApimodelsMatchmakingDetail extends Model {

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("expiredAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String expiredAt;

  @JsonProperty("gameSessionID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String gameSessionID;

  @JsonProperty("histories")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ApimodelsMatchmakingHistory> histories;

  @JsonProperty("matchPool")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String matchPool;

  @JsonProperty("matchRule")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String matchRule;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("partySessionID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String partySessionID;

  @JsonProperty("ticketID")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String ticketID;

  @JsonIgnore
  public ApimodelsMatchmakingDetail createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsMatchmakingDetail> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsMatchmakingDetail>>() {});
  }
}

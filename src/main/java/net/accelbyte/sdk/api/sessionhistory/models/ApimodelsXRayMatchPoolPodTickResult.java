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
public class ApimodelsXRayMatchPoolPodTickResult extends Model {

  @JsonProperty("podName")
  private String podName;

  @JsonProperty("tickId")
  private String tickId;

  @JsonProperty("timestamp")
  private String timestamp;

  @JsonProperty("totalMatchBackfilled")
  private Integer totalMatchBackfilled;

  @JsonProperty("totalMatchCreated")
  private Integer totalMatchCreated;

  @JsonProperty("totalMatchToBackfill")
  private Integer totalMatchToBackfill;

  @JsonProperty("totalTicketBackfilled")
  private Integer totalTicketBackfilled;

  @JsonProperty("totalTicketForBackfill")
  private Integer totalTicketForBackfill;

  @JsonProperty("totalTicketForMatch")
  private Integer totalTicketForMatch;

  @JsonProperty("totalTicketInQueue")
  private Integer totalTicketInQueue;

  @JsonProperty("totalTicketMatched")
  private Integer totalTicketMatched;

  @JsonIgnore
  public ApimodelsXRayMatchPoolPodTickResult createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsXRayMatchPoolPodTickResult> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsXRayMatchPoolPodTickResult>>() {});
  }
}

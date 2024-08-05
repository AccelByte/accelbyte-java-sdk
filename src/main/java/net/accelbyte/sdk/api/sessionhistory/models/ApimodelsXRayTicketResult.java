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
public class ApimodelsXRayTicketResult extends Model {

  @JsonProperty("elapsedTime")
  private Float elapsedTime;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isBackfill")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isBackfill;

  @JsonProperty("isPivot")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isPivot;

  @JsonProperty("matchpool")
  private String matchpool;

  @JsonProperty("memberAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> memberAttributes;

  @JsonProperty("podName")
  private String podName;

  @JsonProperty("reason")
  private String reason;

  @JsonProperty("region")
  private String region;

  @JsonProperty("tickId")
  private String tickId;

  @JsonProperty("ticketId")
  private String ticketId;

  @JsonProperty("ticketStatus")
  private String ticketStatus;

  @JsonProperty("timestamp")
  private String timestamp;

  @JsonProperty("totalPlayers")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer totalPlayers;

  @JsonIgnore
  public ApimodelsXRayTicketResult createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsXRayTicketResult> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsXRayTicketResult>>() {});
  }
}

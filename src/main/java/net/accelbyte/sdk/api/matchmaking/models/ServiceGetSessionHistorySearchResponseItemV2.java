/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ServiceGetSessionHistorySearchResponseItemV2 extends Model {

  @JsonProperty("_id")
  private String id;

  @JsonProperty("created_at")
  private String createdAt;

  @JsonProperty("game_mode")
  private String gameMode;

  @JsonProperty("joinable")
  private Boolean joinable;

  @JsonProperty("match_id")
  private String matchId;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("status")
  private String status;

  @JsonProperty("sub_game_mode")
  private List<String> subGameMode;

  @JsonIgnore
  public ServiceGetSessionHistorySearchResponseItemV2 createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ServiceGetSessionHistorySearchResponseItemV2> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(
            json, new TypeReference<List<ServiceGetSessionHistorySearchResponseItemV2>>() {});
  }
}

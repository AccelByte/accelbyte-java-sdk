/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.models;

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
public class ApiFleetListItemResponse extends Model {

  @JsonProperty("active")
  private Boolean active;

  @JsonProperty("counts")
  private List<ApiFleetRegionalServerCounts> counts;

  @JsonProperty("fallbackFleet")
  private String fallbackFleet;

  @JsonProperty("id")
  private String id;

  @JsonProperty("image")
  private String image;

  @JsonProperty("instanceProvider")
  private String instanceProvider;

  @JsonProperty("isLocal")
  private Boolean isLocal;

  @JsonProperty("name")
  private String name;

  @JsonProperty("onDemand")
  private Boolean onDemand;

  @JsonProperty("primaryFleet")
  private String primaryFleet;

  @JsonProperty("regions")
  private List<String> regions;

  @JsonIgnore
  public ApiFleetListItemResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiFleetListItemResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApiFleetListItemResponse>>() {});
  }
}

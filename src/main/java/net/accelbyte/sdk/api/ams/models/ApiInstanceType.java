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
public class ApiInstanceType extends Model {

  @JsonProperty("capacity")
  private List<ApiCapacity> capacity;

  @JsonProperty("description")
  private String description;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isBaremetal")
  private Boolean isBaremetal;

  @JsonProperty("memoryGiB")
  private Float memoryGiB;

  @JsonProperty("minSpeed")
  private String minSpeed;

  @JsonProperty("name")
  private String name;

  @JsonProperty("ownerAccountId")
  private String ownerAccountId;

  @JsonProperty("provider")
  private String provider;

  @JsonProperty("virtualCpu")
  private Integer virtualCpu;

  @JsonIgnore
  public ApiInstanceType createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiInstanceType> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApiInstanceType>>() {});
  }
}

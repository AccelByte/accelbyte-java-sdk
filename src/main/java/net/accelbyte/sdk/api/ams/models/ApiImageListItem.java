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
public class ApiImageListItem extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("id")
  private String id;

  @JsonProperty("isProtected")
  private Boolean isProtected;

  @JsonProperty("name")
  private String name;

  @JsonProperty("referencingFleets")
  private Integer referencingFleets;

  @JsonProperty("sizeInByte")
  private Integer sizeInByte;

  @JsonProperty("status")
  private String status;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("uploadedAt")
  private String uploadedAt;

  @JsonProperty("uploadedBy")
  private String uploadedBy;

  @JsonIgnore
  public ApiImageListItem createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiImageListItem> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApiImageListItem>>() {});
  }
}
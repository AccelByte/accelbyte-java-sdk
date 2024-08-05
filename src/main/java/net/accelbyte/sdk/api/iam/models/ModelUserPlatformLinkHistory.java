/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelUserPlatformLinkHistory extends Model {

  @JsonProperty("action")
  private String action;

  @JsonProperty("actor")
  private String actor;

  @JsonProperty("actorType")
  private String actorType;

  @JsonProperty("createdAt")
  private Long createdAt;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("platform")
  private String platform;

  @JsonProperty("platformDisplayName")
  private String platformDisplayName;

  @JsonProperty("platformId")
  private String platformId;

  @JsonProperty("platformUserId")
  private String platformUserId;

  @JsonProperty("publisherUserId")
  private String publisherUserId;

  @JsonIgnore
  public ModelUserPlatformLinkHistory createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelUserPlatformLinkHistory> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelUserPlatformLinkHistory>>() {});
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsartifact.models;

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
public class ModelsQueue extends Model {

  @JsonProperty("AllocationID")
  private String allocationID;

  @JsonProperty("CreatedAt")
  private String createdAt;

  @JsonProperty("Failed")
  private Boolean failed;

  @JsonProperty("FailedReason")
  private String failedReason;

  @JsonProperty("Namespace")
  private String namespace;

  @JsonProperty("NodeIP")
  private String nodeIP;

  @JsonProperty("PodName")
  private String podName;

  @JsonProperty("Uploading")
  private Boolean uploading;

  @JsonIgnore
  public ModelsQueue createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsQueue> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsQueue>>() {});
  }
}

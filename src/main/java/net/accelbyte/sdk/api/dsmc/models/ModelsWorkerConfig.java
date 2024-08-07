/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.models;

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
public class ModelsWorkerConfig extends Model {

  @JsonProperty("AutoDeletion")
  private Boolean autoDeletion;

  @JsonProperty("CreatedAt")
  private String createdAt;

  @JsonProperty("CreatedBy")
  private String createdBy;

  @JsonProperty("GhostWorker")
  private Boolean ghostWorker;

  @JsonProperty("ManualBufferOverride")
  private Boolean manualBufferOverride;

  @JsonProperty("ModifiedBy")
  private String modifiedBy;

  @JsonProperty("Namespace")
  private String namespace;

  @JsonProperty("UpdatedAt")
  private String updatedAt;

  @JsonProperty("ZombieWorker")
  private Boolean zombieWorker;

  @JsonIgnore
  public ModelsWorkerConfig createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsWorkerConfig> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsWorkerConfig>>() {});
  }
}

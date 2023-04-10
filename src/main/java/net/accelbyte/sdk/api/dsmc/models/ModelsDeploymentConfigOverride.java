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
public class ModelsDeploymentConfigOverride extends Model {

  @JsonProperty("buffer_count")
  private Integer bufferCount;

  @JsonProperty("buffer_percent")
  private Integer bufferPercent;

  @JsonProperty("configuration")
  private String configuration;

  @JsonProperty("enable_region_overrides")
  private Boolean enableRegionOverrides;

  @JsonProperty("game_version")
  private String gameVersion;

  @JsonProperty("max_count")
  private Integer maxCount;

  @JsonProperty("min_count")
  private Integer minCount;

  @JsonProperty("name")
  private String name;

  @JsonProperty("region_overrides")
  private Map<String, ModelsPodCountConfigOverride> regionOverrides;

  @JsonProperty("regions")
  private List<String> regions;

  @JsonProperty("session_timeout")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer sessionTimeout;

  @JsonProperty("unlimited")
  private Boolean unlimited;

  @JsonProperty("use_buffer_percent")
  private Boolean useBufferPercent;

  @JsonIgnore
  public ModelsDeploymentConfigOverride createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsDeploymentConfigOverride> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsDeploymentConfigOverride>>() {});
  }
}

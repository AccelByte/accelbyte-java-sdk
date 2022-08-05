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
@AllArgsConstructor
@NoArgsConstructor
public class ModelsDSMConfigExport extends Model {

  @JsonProperty("claim_timeout")
  private Integer claimTimeout;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("creation_timeout")
  private Integer creationTimeout;

  @JsonProperty("default_version")
  private String defaultVersion;

  @JsonProperty("deployments")
  private List<ModelsDeploymentWithOverride> deployments;

  @JsonProperty("images")
  private List<ModelsImageRecord> images;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("pod_configs")
  private List<ModelsPodConfigRecord> podConfigs;

  @JsonProperty("port")
  private Integer port;

  @JsonProperty("ports")
  private Map<String, Integer> ports;

  @JsonProperty("protocol")
  private String protocol;

  @JsonProperty("providers")
  private List<String> providers;

  @JsonProperty("session_timeout")
  private Integer sessionTimeout;

  @JsonProperty("unreachable_timeout")
  private Integer unreachableTimeout;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public ModelsDSMConfigExport createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsDSMConfigExport> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsDSMConfigExport>>() {});
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.models;

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
public class ApimodelAppItem extends Model {

  @JsonProperty("appId")
  private String appId;

  @JsonProperty("appName")
  private String appName;

  @JsonProperty("appRepoArn")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appRepoArn;

  @JsonProperty("appRepoUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appRepoUrl;

  @JsonProperty("appStatus")
  private String appStatus;

  @JsonProperty("autoscaling")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelAutoscalingResponse autoscaling;

  @JsonProperty("basePath")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String basePath;

  @JsonProperty("cpu")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelCPUResponse cpu;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("deletedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String deletedAt;

  @JsonProperty("deploymentCreatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String deploymentCreatedAt;

  @JsonProperty("deploymentId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String deploymentId;

  @JsonProperty("deploymentImageTag")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String deploymentImageTag;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("gameName")
  private String gameName;

  @JsonProperty("isResourceApplied")
  private Boolean isResourceApplied;

  @JsonProperty("memory")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelMemoryResponse memory;

  @JsonProperty("message")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String message;

  @JsonProperty("redeploymentInfo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelAppRedeploymentInfo redeploymentInfo;

  @JsonProperty("replica")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelReplicaResponse replica;

  @JsonProperty("scenario")
  private String scenario;

  @JsonProperty("servicePublicURL")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String servicePublicURL;

  @JsonProperty("serviceURL")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String serviceURL;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("vmSharingConfiguration")
  private String vmSharingConfiguration;

  @JsonIgnore
  public ApimodelAppItem createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelAppItem> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelAppItem>>() {});
  }
}

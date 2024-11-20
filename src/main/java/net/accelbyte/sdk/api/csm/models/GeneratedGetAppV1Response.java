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
public class GeneratedGetAppV1Response extends Model {

  @JsonProperty("appId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appId;

  @JsonProperty("appName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appName;

  @JsonProperty("appRepoArn")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appRepoArn;

  @JsonProperty("appRepoUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appRepoUrl;

  @JsonProperty("appStatus")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appStatus;

  @JsonProperty("app_release_status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appReleaseStatus;

  @JsonProperty("basePath")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String basePath;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("deletedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String deletedAt;

  @JsonProperty("deploymentCreatedAt")
  private String deploymentCreatedAt;

  @JsonProperty("deploymentId")
  private String deploymentId;

  @JsonProperty("deploymentImageTag")
  private String deploymentImageTag;

  @JsonProperty("deployment_status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String deploymentStatus;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("message")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String message;

  @JsonProperty("scenario")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String scenario;

  @JsonProperty("servicePublicURL")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String servicePublicURL;

  @JsonProperty("serviceURL")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String serviceURL;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonIgnore
  public GeneratedGetAppV1Response createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<GeneratedGetAppV1Response> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<GeneratedGetAppV1Response>>() {});
  }
}

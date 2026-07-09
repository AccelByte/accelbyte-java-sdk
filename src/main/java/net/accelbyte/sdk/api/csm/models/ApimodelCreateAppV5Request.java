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
public class ApimodelCreateAppV5Request extends Model {

  @JsonProperty("autoscaling")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CreateappparamsAutoscalingRequest autoscaling;

  @JsonProperty("cpu")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CreateappparamsCPURequest cpu;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("memory")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CreateappparamsMemoryRequest memory;

  @JsonProperty("preferred_k8s_namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String preferredK8sNamespace;

  @JsonProperty("replica")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CreateappparamsReplicaRequest replica;

  @JsonProperty("scenario")
  private String scenario;

  @JsonProperty("vmSharingConfiguration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String vmSharingConfiguration;

  @JsonIgnore
  public ApimodelCreateAppV5Request createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelCreateAppV5Request> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelCreateAppV5Request>>() {});
  }
}

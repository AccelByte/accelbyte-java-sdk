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
public class ApimodelCSMAppLimitsResponse extends Model {

  @JsonProperty("autoscaling")
  private ModelCSMAutoscalingDefaults autoscaling;

  @JsonProperty("extendAppCPULimit")
  private Integer extendAppCPULimit;

  @JsonProperty("extendAppEventHandlerCPULimit")
  private Integer extendAppEventHandlerCPULimit;

  @JsonProperty("extendAppMemoryLimit")
  private Integer extendAppMemoryLimit;

  @JsonProperty("extendAppReplicaLimit")
  private Integer extendAppReplicaLimit;

  @JsonProperty("extendAppeEventHandlerMemoryLimit")
  private Integer extendAppeEventHandlerMemoryLimit;

  @JsonProperty("maxSubscriberCount")
  private Integer maxSubscriberCount;

  @JsonIgnore
  public ApimodelCSMAppLimitsResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelCSMAppLimitsResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelCSMAppLimitsResponse>>() {});
  }
}

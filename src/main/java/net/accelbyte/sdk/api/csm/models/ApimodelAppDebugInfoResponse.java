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
public class ApimodelAppDebugInfoResponse extends Model {

  @JsonProperty("allowedInterceptedPorts")
  private List<DomainAllowedInterceptedPort> allowedInterceptedPorts;

  @JsonProperty("appStatus")
  private String appStatus;

  @JsonProperty("debugPods")
  private List<DomainDebugPod> debugPods;

  @JsonProperty("exposedServices")
  private List<DomainExposedService> exposedServices;

  @JsonProperty("isDebugModeEnabled")
  private Boolean isDebugModeEnabled;

  @JsonProperty("isDebugSessionConnected")
  private Boolean isDebugSessionConnected;

  @JsonIgnore
  public ApimodelAppDebugInfoResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelAppDebugInfoResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelAppDebugInfoResponse>>() {});
  }
}

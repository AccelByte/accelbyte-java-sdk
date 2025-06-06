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
public class ApimodelCreateAppV2Request extends Model {

  @JsonProperty("autoscaling")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelAutoscalingRequest autoscaling;

  @JsonProperty("cpu")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelCPURequest cpu;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("memory")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelMemoryRequest memory;

  @JsonProperty("replica")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelReplicaRequest replica;

  @JsonProperty("scenario")
  private String scenario;

  @JsonProperty("vmSharingConfiguration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String vmSharingConfiguration;

  @JsonIgnore
  public ApimodelCreateAppV2Request createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelCreateAppV2Request> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelCreateAppV2Request>>() {});
  }
}

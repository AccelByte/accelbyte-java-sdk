/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.models;

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
public class ApiFleetGetResponse extends Model {

  @JsonProperty("active")
  private Boolean active;

  @JsonProperty("claimKeys")
  private List<String> claimKeys;

  @JsonProperty("dsHostConfiguration")
  private ApiDSHostConfiguration dsHostConfiguration;

  @JsonProperty("id")
  private String id;

  @JsonProperty("imageDeploymentProfile")
  private ApiImageDeploymentProfile imageDeploymentProfile;

  @JsonProperty("isLocal")
  private Boolean isLocal;

  @JsonProperty("name")
  private String name;

  @JsonProperty("onDemand")
  private Boolean onDemand;

  @JsonProperty("regions")
  private List<ApiRegionConfig> regions;

  @JsonIgnore
  public ApiFleetGetResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiFleetGetResponse> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApiFleetGetResponse>>() {});
  }
}

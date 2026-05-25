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
public class DomainKeyValueClusterConfig extends Model {

  @JsonProperty("max_cluster_per_studio_private_cloud")
  private Integer maxClusterPerStudioPrivateCloud;

  @JsonProperty("max_cluster_per_studio_shared_cloud")
  private Integer maxClusterPerStudioSharedCloud;

  @JsonProperty("max_integration_per_cluster")
  private Integer maxIntegrationPerCluster;

  @JsonIgnore
  public DomainKeyValueClusterConfig createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DomainKeyValueClusterConfig> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<DomainKeyValueClusterConfig>>() {});
  }
}

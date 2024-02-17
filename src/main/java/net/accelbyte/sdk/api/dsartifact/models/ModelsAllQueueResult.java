/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsartifact.models;

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
public class ModelsAllQueueResult extends Model {

  @JsonProperty("allocation_id")
  private String allocationId;

  @JsonProperty("created_at")
  private String createdAt;

  @JsonProperty("failed")
  private Boolean failed;

  @JsonProperty("failed_reason")
  private String failedReason;

  @JsonProperty("node_ip")
  private String nodeIp;

  @JsonProperty("pod_name")
  private String podName;

  @JsonProperty("uploading")
  private Boolean uploading;

  @JsonIgnore
  public ModelsAllQueueResult createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsAllQueueResult> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAllQueueResult>>() {});
  }
}

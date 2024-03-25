/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class ModelsServer extends Model {

  @JsonProperty("allocation_id")
  private String allocationId;

  @JsonProperty("alternate_ips")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> alternateIps;

  @JsonProperty("cpu_limit")
  private Integer cpuLimit;

  @JsonProperty("cpu_request")
  private String cpuRequest;

  @JsonProperty("deployment")
  private String deployment;

  @JsonProperty("game_version")
  private String gameVersion;

  @JsonProperty("image_version")
  private String imageVersion;

  @JsonProperty("ip")
  private String ip;

  @JsonProperty("is_override_game_version")
  private Boolean isOverrideGameVersion;

  @JsonProperty("last_update")
  private String lastUpdate;

  @JsonProperty("mem_limit")
  private Integer memLimit;

  @JsonProperty("mem_request")
  private String memRequest;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("params")
  private String params;

  @JsonProperty("pod_name")
  private String podName;

  @JsonProperty("port")
  private Integer port;

  @JsonProperty("ports")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, Integer> ports;

  @JsonProperty("provider")
  private String provider;

  @JsonProperty("region")
  private String region;

  @JsonProperty("session_id")
  private String sessionId;

  @JsonProperty("status")
  private String status;

  @JsonProperty("status_history")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsStatusHistory> statusHistory;

  @JsonIgnore
  public ModelsServer createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsServer> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsServer>>() {});
  }
}

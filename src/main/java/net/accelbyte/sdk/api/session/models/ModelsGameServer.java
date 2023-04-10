/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.models;

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
public class ModelsGameServer extends Model {

  @JsonProperty("alternate_ips")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> alternateIps;

  @JsonProperty("custom_attribute")
  private String customAttribute;

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

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("pod_name")
  private String podName;

  @JsonProperty("port")
  private Integer port;

  @JsonProperty("ports")
  private Map<String, Integer> ports;

  @JsonProperty("protocol")
  private String protocol;

  @JsonProperty("provider")
  private String provider;

  @JsonProperty("region")
  private String region;

  @JsonProperty("session_id")
  private String sessionId;

  @JsonProperty("status")
  private String status;

  @JsonIgnore
  public ModelsGameServer createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsGameServer> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGameServer>>() {});
  }
}

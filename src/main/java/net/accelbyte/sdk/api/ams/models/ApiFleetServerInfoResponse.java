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
public class ApiFleetServerInfoResponse extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("fleetId")
  private String fleetId;

  @JsonProperty("fleetName")
  private String fleetName;

  @JsonProperty("imageCmd")
  private String imageCmd;

  @JsonProperty("imageId")
  private String imageId;

  @JsonProperty("instanceType")
  private String instanceType;

  @JsonProperty("ipAddress")
  private String ipAddress;

  @JsonProperty("portConfiguration")
  private List<ApiPortConfiguration> portConfiguration;

  @JsonProperty("ports")
  private Map<String, Integer> ports;

  @JsonProperty("region")
  private String region;

  @JsonProperty("serverConfiguration")
  private String serverConfiguration;

  @JsonProperty("serverId")
  private String serverId;

  @JsonProperty("sessionId")
  private String sessionId;

  @JsonProperty("status")
  private String status;

  @JsonIgnore
  public ApiFleetServerInfoResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiFleetServerInfoResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApiFleetServerInfoResponse>>() {});
  }
}

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
public class ApiArtifactResponse extends Model {

  @JsonProperty("artifactType")
  private String artifactType;

  @JsonProperty("createdOn")
  private String createdOn;

  @JsonProperty("dsId")
  private String dsId;

  @JsonProperty("expiresOn")
  private String expiresOn;

  @JsonProperty("filename")
  private String filename;

  @JsonProperty("fleetId")
  private String fleetId;

  @JsonProperty("id")
  private String id;

  @JsonProperty("imageId")
  private String imageId;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("region")
  private String region;

  @JsonProperty("sizeBytes")
  private Integer sizeBytes;

  @JsonProperty("status")
  private String status;

  @JsonIgnore
  public ApiArtifactResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiArtifactResponse> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApiArtifactResponse>>() {});
  }
}

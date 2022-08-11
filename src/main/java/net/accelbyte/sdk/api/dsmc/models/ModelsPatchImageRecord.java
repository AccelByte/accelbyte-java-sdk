/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.models;

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
@AllArgsConstructor
@NoArgsConstructor
public class ModelsPatchImageRecord extends Model {

  @JsonProperty("artifactPath")
  private String artifactPath;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("dockerPath")
  private String dockerPath;

  @JsonProperty("image")
  private String image;

  @JsonProperty("imageSize")
  private Integer imageSize;

  @JsonProperty("modifiedBy")
  private String modifiedBy;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("patchVersion")
  private String patchVersion;

  @JsonProperty("persistent")
  private Boolean persistent;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("version")
  private String version;

  @JsonIgnore
  public ModelsPatchImageRecord createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsPatchImageRecord> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPatchImageRecord>>() {});
  }
}

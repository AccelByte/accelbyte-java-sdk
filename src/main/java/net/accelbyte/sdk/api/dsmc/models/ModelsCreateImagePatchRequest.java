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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsCreateImagePatchRequest extends Model {

  @JsonProperty("artifactPath")
  private String artifactPath;

  @JsonProperty("dockerPath")
  private String dockerPath;

  @JsonProperty("image")
  private String image;

  @JsonProperty("imageSize")
  private Integer imageSize;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("patchVersion")
  private String patchVersion;

  @JsonProperty("persistent")
  private Boolean persistent;

  @JsonProperty("uploaderFlags")
  private List<ModelsUploaderFlag> uploaderFlags;

  @JsonProperty("version")
  private String version;

  @JsonIgnore
  public ModelsCreateImagePatchRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsCreateImagePatchRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsCreateImagePatchRequest>>() {});
  }
}

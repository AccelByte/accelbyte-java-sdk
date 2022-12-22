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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsGetImageLimitResponseData extends Model {

  @JsonProperty("image_count")
  private Integer imageCount;

  @JsonProperty("image_limit")
  private Integer imageLimit;

  @JsonProperty("non_persistent_image_number")
  private Integer nonPersistentImageNumber;

  @JsonProperty("non_persistent_image_used_in_deployment_number")
  private Integer nonPersistentImageUsedInDeploymentNumber;

  @JsonIgnore
  public ModelsGetImageLimitResponseData createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsGetImageLimitResponseData> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsGetImageLimitResponseData>>() {});
  }
}

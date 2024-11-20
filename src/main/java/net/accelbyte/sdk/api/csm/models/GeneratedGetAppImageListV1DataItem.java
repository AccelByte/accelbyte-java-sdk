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
public class GeneratedGetAppImageListV1DataItem extends Model {

  @JsonProperty("imageDigest")
  private String imageDigest;

  @JsonProperty("imageScanStatus")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private GeneratedGetAppImageListV1DataItemImageScanStatus imageScanStatus;

  @JsonProperty("imageTag")
  private String imageTag;

  @JsonProperty("size")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long size;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonIgnore
  public GeneratedGetAppImageListV1DataItem createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<GeneratedGetAppImageListV1DataItem> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<GeneratedGetAppImageListV1DataItem>>() {});
  }
}

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
public class ApimodelGetAppImageListV2DataItem extends Model {

  @JsonProperty("IsActive")
  private Boolean isActive;

  @JsonProperty("imageDigest")
  private String imageDigest;

  @JsonProperty("imageScanResult")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelGetAppImageListV2DataItemImageScanResult imageScanResult;

  @JsonProperty("imageScanStatus")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ApimodelGetAppImageListV2DataItemImageScanStatus imageScanStatus;

  @JsonProperty("imageTag")
  private String imageTag;

  @JsonProperty("size")
  private Long size;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonIgnore
  public ApimodelGetAppImageListV2DataItem createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelGetAppImageListV2DataItem> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelGetAppImageListV2DataItem>>() {});
  }
}

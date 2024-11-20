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
public class ApimodelGetAppListV2Request extends Model {

  @JsonProperty("appNames")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> appNames;

  @JsonProperty("appStatuses")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> appStatuses;

  @JsonProperty("fuzzyAppName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String fuzzyAppName;

  @JsonProperty("scenario")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String scenario;

  @JsonIgnore
  public ApimodelGetAppListV2Request createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelGetAppListV2Request> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelGetAppListV2Request>>() {});
  }
}

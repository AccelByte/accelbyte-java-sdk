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
public class GeneratedGetAppListV1Request extends Model {

  @JsonProperty("appNames")
  private List<String> appNames;

  @JsonProperty("fuzzyAppName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String fuzzyAppName;

  @JsonProperty("scenario")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String scenario;

  @JsonProperty("statuses")
  private List<String> statuses;

  @JsonIgnore
  public GeneratedGetAppListV1Request createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<GeneratedGetAppListV1Request> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<GeneratedGetAppListV1Request>>() {});
  }
}

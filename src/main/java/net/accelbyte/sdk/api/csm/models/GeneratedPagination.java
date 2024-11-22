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
public class GeneratedPagination extends Model {

  @JsonProperty("first")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String first;

  @JsonProperty("last")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String last;

  @JsonProperty("next")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String next;

  @JsonProperty("previous")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String previous;

  @JsonIgnore
  public GeneratedPagination createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<GeneratedPagination> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<GeneratedPagination>>() {});
  }
}

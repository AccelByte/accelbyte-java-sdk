/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.models;

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
public class UpdateBasePolicyRequest extends Model {

  @JsonProperty("affectedClientIds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> affectedClientIds;

  @JsonProperty("affectedCountries")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> affectedCountries;

  @JsonProperty("basePolicyName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String basePolicyName;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("isHidden")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isHidden;

  @JsonProperty("isHiddenPublic")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean isHiddenPublic;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

  @JsonIgnore
  public UpdateBasePolicyRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<UpdateBasePolicyRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<UpdateBasePolicyRequest>>() {});
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UpdateBasePolicyRequest extends Model {

  @JsonProperty("affectedClientIds")
  private List<String> affectedClientIds;

  @JsonProperty("affectedCountries")
  private List<String> affectedCountries;

  @JsonProperty("basePolicyName")
  private String basePolicyName;

  @JsonProperty("description")
  private String description;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("tags")
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

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import java.util.Map;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FullCategoryInfo extends Model {

  @JsonProperty("categoryPath")
  private String categoryPath;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("localizationDisplayNames")
  private Map<String, String> localizationDisplayNames;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("parentCategoryPath")
  private String parentCategoryPath;

  @JsonProperty("root")
  private Boolean root;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public FullCategoryInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FullCategoryInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<FullCategoryInfo>>() {});
  }
}

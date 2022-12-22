/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class StoreInfo extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("defaultLanguage")
  private String defaultLanguage;

  @JsonProperty("defaultRegion")
  private String defaultRegion;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("published")
  private Boolean published;

  @JsonProperty("publishedTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String publishedTime;

  @JsonProperty("storeId")
  private String storeId;

  @JsonProperty("supportedLanguages")
  private List<String> supportedLanguages;

  @JsonProperty("supportedRegions")
  private List<String> supportedRegions;

  @JsonProperty("title")
  private String title;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public StoreInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<StoreInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<StoreInfo>>() {});
  }
}

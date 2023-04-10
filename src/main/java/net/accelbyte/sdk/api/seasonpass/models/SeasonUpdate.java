/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class SeasonUpdate extends Model {

  @JsonProperty("autoClaim")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean autoClaim;

  @JsonProperty("defaultLanguage")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String defaultLanguage;

  @JsonProperty("defaultRequiredExp")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer defaultRequiredExp;

  @JsonProperty("draftStoreId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String draftStoreId;

  @JsonProperty("end")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String end;

  @JsonProperty("excessStrategy")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ExcessStrategy excessStrategy;

  @JsonProperty("images")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<Image> images;

  @JsonProperty("localizations")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, Localization> localizations;

  @JsonProperty("name")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String name;

  @JsonProperty("start")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String start;

  @JsonProperty("tierItemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String tierItemId;

  @JsonIgnore
  public SeasonUpdate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<SeasonUpdate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<SeasonUpdate>>() {});
  }
}

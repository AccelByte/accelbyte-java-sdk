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
public class ApimodelGetListOfConfigurationsV2DataItem extends Model {

  @JsonProperty("applyMask")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean applyMask;

  @JsonProperty("configId")
  private String configId;

  @JsonProperty("configName")
  private String configName;

  @JsonProperty("configType")
  private String configType;

  @JsonProperty("deploymentStatus")
  private String deploymentStatus;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("editable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean editable;

  @JsonProperty("isHidden")
  private Boolean isHidden;

  @JsonProperty("source")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String source;

  @JsonProperty("value")
  private String value;

  @JsonIgnore
  public ApimodelGetListOfConfigurationsV2DataItem createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelGetListOfConfigurationsV2DataItem> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelGetListOfConfigurationsV2DataItem>>() {});
  }
}

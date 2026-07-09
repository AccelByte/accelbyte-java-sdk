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
public class ApimodelAppItemV5 extends Model {

  @JsonProperty("appId")
  private String appId;

  @JsonProperty("appName")
  private String appName;

  @JsonProperty("appStatus")
  private String appStatus;

  @JsonProperty("basePath")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String basePath;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("gameName")
  private String gameName;

  @JsonProperty("scenario")
  private String scenario;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("vmSharingConfiguration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String vmSharingConfiguration;

  @JsonIgnore
  public ApimodelAppItemV5 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelAppItemV5> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelAppItemV5>>() {});
  }
}

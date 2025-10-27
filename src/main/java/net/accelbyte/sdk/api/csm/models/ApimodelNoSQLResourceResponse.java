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
public class ApimodelNoSQLResourceResponse extends Model {

  @JsonProperty("configuration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private NosqlresourceNoSQLResourceConfiguration configuration;

  @JsonProperty("hostnames")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String hostnames;

  @JsonProperty("lastRotatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String lastRotatedAt;

  @JsonProperty("platformName")
  private String platformName;

  @JsonProperty("region")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String region;

  @JsonProperty("resourceId")
  private String resourceId;

  @JsonProperty("resourceName")
  private String resourceName;

  @JsonProperty("resourceType")
  private String resourceType;

  @JsonProperty("status")
  private String status;

  @JsonProperty("studioName")
  private String studioName;

  @JsonIgnore
  public ApimodelNoSQLResourceResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelNoSQLResourceResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelNoSQLResourceResponse>>() {});
  }
}

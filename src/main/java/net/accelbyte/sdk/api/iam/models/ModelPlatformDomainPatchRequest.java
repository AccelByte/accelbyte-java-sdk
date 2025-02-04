/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.models;

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
public class ModelPlatformDomainPatchRequest extends Model {

  @JsonProperty("affectedClientIDs")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> affectedClientIDs;

  @JsonProperty("assignedNamespaces")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> assignedNamespaces;

  @JsonProperty("domain")
  private String domain;

  @JsonProperty("roleId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String roleId;

  @JsonProperty("ssoCfg")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private AccountcommonSsoConfigPatchReq ssoCfg;

  @JsonIgnore
  public ModelPlatformDomainPatchRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelPlatformDomainPatchRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelPlatformDomainPatchRequest>>() {});
  }
}

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
public class ModelRoleCreateV3Request extends Model {

  @JsonProperty("adminRole")
  private Boolean adminRole;

  @JsonProperty("deletable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean deletable;

  @JsonProperty("isWildcard")
  private Boolean isWildcard;

  @JsonProperty("managers")
  private List<AccountcommonRoleManagerV3> managers;

  @JsonProperty("members")
  private List<AccountcommonRoleMemberV3> members;

  @JsonProperty("permissions")
  private List<AccountcommonPermissionV3> permissions;

  @JsonProperty("roleName")
  private String roleName;

  @JsonIgnore
  public ModelRoleCreateV3Request createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelRoleCreateV3Request> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelRoleCreateV3Request>>() {});
  }
}

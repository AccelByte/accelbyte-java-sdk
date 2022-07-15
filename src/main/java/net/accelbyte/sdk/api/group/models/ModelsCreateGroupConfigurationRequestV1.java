/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.models;

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
public class ModelsCreateGroupConfigurationRequestV1 extends Model {

  @JsonProperty("configurationCode")
  private String configurationCode;

  @JsonProperty("description")
  private String description;

  @JsonProperty("globalRules")
  private List<ModelsRule> globalRules;

  @JsonProperty("groupAdminRoleId")
  private String groupAdminRoleId;

  @JsonProperty("groupMaxMember")
  private Integer groupMaxMember;

  @JsonProperty("groupMemberRoleId")
  private String groupMemberRoleId;

  @JsonProperty("name")
  private String name;

  @JsonIgnore
  public ModelsCreateGroupConfigurationRequestV1 createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsCreateGroupConfigurationRequestV1> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsCreateGroupConfigurationRequestV1>>() {});
  }
}

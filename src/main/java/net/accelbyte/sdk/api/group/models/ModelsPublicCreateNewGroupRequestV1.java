/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.models;

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
public class ModelsPublicCreateNewGroupRequestV1 extends Model {

  @JsonProperty("configurationCode")
  private String configurationCode;

  @JsonProperty("customAttributes")
  private Map<String, ?> customAttributes;

  @JsonProperty("groupDescription")
  private String groupDescription;

  @JsonProperty("groupIcon")
  private String groupIcon;

  @JsonProperty("groupMaxMember")
  private Integer groupMaxMember;

  @JsonProperty("groupName")
  private String groupName;

  @JsonProperty("groupRegion")
  private String groupRegion;

  @JsonProperty("groupRules")
  private ModelsGroupRule groupRules;

  @JsonProperty("groupType")
  private String groupType;

  @JsonIgnore
  public ModelsPublicCreateNewGroupRequestV1 createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsPublicCreateNewGroupRequestV1> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsPublicCreateNewGroupRequestV1>>() {});
  }
}

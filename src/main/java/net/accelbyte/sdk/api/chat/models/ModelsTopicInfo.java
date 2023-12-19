/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.models;

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
public class ModelsTopicInfo extends Model {

  @JsonProperty("createdAt")
  private Integer createdAt;

  @JsonProperty("deletedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer deletedAt;

  @JsonProperty("id")
  private String id;

  @JsonProperty("members")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<TopicInfoMember> members;

  @JsonProperty("name")
  private String name;

  @JsonProperty("subType")
  private String subType;

  @JsonProperty("type")
  private String type;

  @JsonIgnore
  public ModelsTopicInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsTopicInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsTopicInfo>>() {});
  }
}

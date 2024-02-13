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
public class ModelUserWithPlatformInfo extends Model {

  @JsonProperty("avatarUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String avatarUrl;

  @JsonProperty("displayName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String displayName;

  @JsonProperty("platformInfos")
  private List<ModelUserPlatformInfo> platformInfos;

  @JsonProperty("uniqueDisplayName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String uniqueDisplayName;

  @JsonProperty("userId")
  private String userId;

  @JsonProperty("username")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String username;

  @JsonProperty("xuid")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String xuid;

  @JsonIgnore
  public ModelUserWithPlatformInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelUserWithPlatformInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelUserWithPlatformInfo>>() {});
  }
}

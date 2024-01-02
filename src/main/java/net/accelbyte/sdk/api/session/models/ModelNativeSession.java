/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.models;

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
public class ModelNativeSession extends Model {

  @JsonProperty("CreatedAt")
  private String createdAt;

  @JsonProperty("DeletedAt")
  private String deletedAt;

  @JsonProperty("PushContextID")
  private String pushContextID;

  @JsonProperty("id")
  private String id;

  @JsonProperty("members")
  private List<ModelNativeSessionMember> members;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("nativeSessionPlatforms")
  private Map<String, String> nativeSessionPlatforms;

  @JsonProperty("persistent")
  private Boolean persistent;

  @JsonIgnore
  public ModelNativeSession createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelNativeSession> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelNativeSession>>() {});
  }
}

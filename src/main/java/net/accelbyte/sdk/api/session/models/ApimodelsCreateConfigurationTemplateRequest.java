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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ApimodelsCreateConfigurationTemplateRequest extends Model {

  @JsonProperty("clientVersion")
  private String clientVersion;

  @JsonProperty("deployment")
  private String deployment;

  @JsonProperty("inactiveTimeout")
  private Integer inactiveTimeout;

  @JsonProperty("inviteTimeout")
  private Integer inviteTimeout;

  @JsonProperty("joinability")
  private String joinability;

  @JsonProperty("maxPlayers")
  private Integer maxPlayers;

  @JsonProperty("minPlayers")
  private Integer minPlayers;

  @JsonProperty("name")
  private String name;

  @JsonProperty("persistent")
  private Boolean persistent;

  @JsonProperty("requestedRegions")
  private List<String> requestedRegions;

  @JsonProperty("textChat")
  private Boolean textChat;

  @JsonProperty("type")
  private String type;

  @JsonIgnore
  public ApimodelsCreateConfigurationTemplateRequest createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsCreateConfigurationTemplateRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsCreateConfigurationTemplateRequest>>() {});
  }
}

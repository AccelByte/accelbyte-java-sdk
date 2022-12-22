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
public class ApimodelsCreatePartyRequest extends Model {

  @JsonProperty("attributes")
  private Map<String, ?> attributes;

  @JsonProperty("configurationName")
  private String configurationName;

  @JsonProperty("inactiveTimeout")
  private Integer inactiveTimeout;

  @JsonProperty("inviteTimeout")
  private Integer inviteTimeout;

  @JsonProperty("joinability")
  private String joinability;

  @JsonProperty("maxPlayers")
  private Integer maxPlayers;

  @JsonProperty("members")
  private List<ApimodelsRequestMember> members;

  @JsonProperty("minPlayers")
  private Integer minPlayers;

  @JsonProperty("textChat")
  private Boolean textChat;

  @JsonProperty("type")
  private String type;

  @JsonIgnore
  public ApimodelsCreatePartyRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsCreatePartyRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsCreatePartyRequest>>() {});
  }
}

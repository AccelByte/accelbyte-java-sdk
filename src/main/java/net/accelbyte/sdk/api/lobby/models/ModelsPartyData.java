/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.models;

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
public class ModelsPartyData extends Model {

  @JsonProperty("custom_attribute")
  private Map<String, ?> customAttribute;

  @JsonProperty("invitees")
  private List<String> invitees;

  @JsonProperty("leader")
  private String leader;

  @JsonProperty("members")
  private List<String> members;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("partyId")
  private String partyId;

  @JsonProperty("updatedAt")
  private Integer updatedAt;

  @JsonIgnore
  public ModelsPartyData createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsPartyData> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsPartyData>>() {});
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class ModelsMatchingParty extends Model {

  @JsonProperty("match_attributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ModelsMatchAttributes matchAttributes;

  @JsonProperty("party_attributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> partyAttributes;

  @JsonProperty("party_id")
  private String partyId;

  @JsonProperty("party_members")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ModelsPartyMember> partyMembers;

  @JsonIgnore
  public ModelsMatchingParty createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsMatchingParty> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsMatchingParty>>() {});
  }
}

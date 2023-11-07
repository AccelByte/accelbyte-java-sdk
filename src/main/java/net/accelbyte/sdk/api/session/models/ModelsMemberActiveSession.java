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
public class ModelsMemberActiveSession extends Model {

  @JsonProperty("CreatedAt")
  private String createdAt;

  @JsonProperty("ID")
  private String id;

  @JsonProperty("MemberID")
  private String memberID;

  @JsonProperty("Namespace")
  private String namespace;

  @JsonProperty("SessionIDs")
  private List<String> sessionIDs;

  @JsonProperty("SessionTemplate")
  private String sessionTemplate;

  @JsonProperty("Total")
  private Integer total;

  @JsonProperty("UpdatedAt")
  private String updatedAt;

  @JsonIgnore
  public ModelsMemberActiveSession createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsMemberActiveSession> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsMemberActiveSession>>() {});
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
@AllArgsConstructor
@NoArgsConstructor
public class UserPurchasable extends Model {

  @JsonProperty("passItemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String passItemId;

  @JsonProperty("tierItemCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer tierItemCount;

  @JsonProperty("tierItemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String tierItemId;

  @JsonIgnore
  public UserPurchasable createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<UserPurchasable> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<UserPurchasable>>() {});
  }
}

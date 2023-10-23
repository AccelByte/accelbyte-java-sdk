/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.models;

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
public class ApimodelsUpdateItem extends Model {

  @JsonProperty("customAttributes")
  private Map<String, ?> customAttributes;

  @JsonProperty("inventoryId")
  private String inventoryId;

  @JsonProperty("serverCustomAttributes")
  private Map<String, ?> serverCustomAttributes;

  @JsonProperty("slotId")
  private String slotId;

  @JsonProperty("sourceItemId")
  private String sourceItemId;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("type")
  private String type;

  @JsonIgnore
  public ApimodelsUpdateItem createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApimodelsUpdateItem> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsUpdateItem>>() {});
  }
}

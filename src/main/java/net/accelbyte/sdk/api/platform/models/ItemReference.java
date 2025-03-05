/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class ItemReference extends Model {

  @JsonProperty("codeRedemptionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String codeRedemptionId;

  @JsonProperty("conditionName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String conditionName;

  @JsonProperty("dlcId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String dlcId;

  @JsonProperty("itemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemId;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("platform")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platform;

  @JsonProperty("platformProductId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platformProductId;

  @JsonProperty("referenceId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String referenceId;

  @JsonProperty("rewardCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String rewardCode;

  @JsonProperty("storeId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String storeId;

  @JsonIgnore
  public ItemReference createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ItemReference> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ItemReference>>() {});
  }
}

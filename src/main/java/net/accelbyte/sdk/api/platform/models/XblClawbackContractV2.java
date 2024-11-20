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
public class XblClawbackContractV2 extends Model {

  @JsonProperty("eventDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String eventDate;

  @JsonProperty("eventState")
  private String eventState;

  @JsonProperty("lineItemId")
  private String lineItemId;

  @JsonProperty("orderId")
  private String orderId;

  @JsonProperty("productId")
  private String productId;

  @JsonProperty("productType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String productType;

  @JsonProperty("purchasedDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String purchasedDate;

  @JsonProperty("sandboxId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sandboxId;

  @JsonProperty("skuId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String skuId;

  @JsonProperty("subscriptionData")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private XblClawbackEventSubscriptionData subscriptionData;

  @JsonIgnore
  public XblClawbackContractV2 createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<XblClawbackContractV2> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<XblClawbackContractV2>>() {});
  }
}

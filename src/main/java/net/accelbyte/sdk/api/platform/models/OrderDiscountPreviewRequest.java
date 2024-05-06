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
public class OrderDiscountPreviewRequest extends Model {

  @JsonProperty("currencyCode")
  private String currencyCode;

  @JsonProperty("discountCodes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> discountCodes;

  @JsonProperty("discountedPrice")
  private Integer discountedPrice;

  @JsonProperty("itemId")
  private String itemId;

  @JsonProperty("price")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer price;

  @JsonProperty("quantity")
  private Integer quantity;

  @JsonIgnore
  public OrderDiscountPreviewRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<OrderDiscountPreviewRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<OrderDiscountPreviewRequest>>() {});
  }
}

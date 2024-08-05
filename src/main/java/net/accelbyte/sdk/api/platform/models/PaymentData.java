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
public class PaymentData extends Model {

  @JsonProperty("discountAmount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer discountAmount;

  @JsonProperty("discountCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String discountCode;

  @JsonProperty("subtotalPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer subtotalPrice;

  @JsonProperty("tax")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer tax;

  @JsonProperty("totalPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer totalPrice;

  @JsonIgnore
  public PaymentData createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PaymentData> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<PaymentData>>() {});
  }
}

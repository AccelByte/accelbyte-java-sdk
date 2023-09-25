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
public class StreamEventBody extends Model {

  @JsonProperty("account")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String account;

  @JsonProperty("additionalData")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private EventAdditionalData additionalData;

  @JsonProperty("originalTitleName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String originalTitleName;

  @JsonProperty("paymentProductSKU")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentProductSKU;

  @JsonProperty("purchaseDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String purchaseDate;

  @JsonProperty("sourceOrderItemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sourceOrderItemId;

  @JsonProperty("titleName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String titleName;

  @JsonIgnore
  public StreamEventBody createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<StreamEventBody> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<StreamEventBody>>() {});
  }
}

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
public class IAPOrderConsumeDetailInfo extends Model {

  @JsonProperty("correlationId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String correlationId;

  @JsonProperty("iapOrderNo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String iapOrderNo;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("itemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemId;

  @JsonProperty("itemSku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemSku;

  @JsonProperty("lineItemOrderId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String lineItemOrderId;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("orderId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String orderId;

  @JsonProperty("platform")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platform;

  @JsonProperty("productId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String productId;

  @JsonProperty("quantityConsumed")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer quantityConsumed;

  @JsonProperty("quantityRevoked")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer quantityRevoked;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("userId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userId;

  @JsonIgnore
  public String getStatus() {
    return this.status;
  }

  @JsonIgnore
  public Status getStatusAsEnum() {
    return Status.valueOf(this.status);
  }

  @JsonIgnore
  public void setStatus(final String status) {
    this.status = status;
  }

  @JsonIgnore
  public void setStatusFromEnum(final Status status) {
    this.status = status.toString();
  }

  @JsonIgnore
  public IAPOrderConsumeDetailInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<IAPOrderConsumeDetailInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<IAPOrderConsumeDetailInfo>>() {});
  }

  public enum Status {
    FULFILLED("FULFILLED"),
    RECONNECTED("RECONNECTED"),
    REVOKED("REVOKED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class IAPOrderConsumeDetailInfoBuilder {
    private String status;

    public IAPOrderConsumeDetailInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public IAPOrderConsumeDetailInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

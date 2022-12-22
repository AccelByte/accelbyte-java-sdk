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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class IAPOrderInfo extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("credits")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<CreditSummary> credits;

  @JsonProperty("currencyCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String currencyCode;

  @JsonProperty("entitlements")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<EntitlementSummary> entitlements;

  @JsonProperty("fulfilledTime")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String fulfilledTime;

  @JsonProperty("iapOrderNo")
  private String iapOrderNo;

  @JsonProperty("language")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String language;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("price")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float price;

  @JsonProperty("productId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String productId;

  @JsonProperty("quantity")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer quantity;

  @JsonProperty("receiptData")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String receiptData;

  @JsonProperty("region")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String region;

  @JsonProperty("retryCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer retryCount;

  @JsonProperty("sandbox")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean sandbox;

  @JsonProperty("status")
  private String status;

  @JsonProperty("statusReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String statusReason;

  @JsonProperty("transactionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String transactionId;

  @JsonProperty("type")
  private String type;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userId")
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
  public String getType() {
    return this.type;
  }

  @JsonIgnore
  public Type getTypeAsEnum() {
    return Type.valueOf(this.type);
  }

  @JsonIgnore
  public void setType(final String type) {
    this.type = type;
  }

  @JsonIgnore
  public void setTypeFromEnum(final Type type) {
    this.type = type.toString();
  }

  @JsonIgnore
  public IAPOrderInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<IAPOrderInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<IAPOrderInfo>>() {});
  }

  public enum Status {
    FAILED("FAILED"),
    FULFILLED("FULFILLED"),
    VERIFIED("VERIFIED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Type {
    APPLE("APPLE"),
    EPICGAMES("EPICGAMES"),
    GOOGLE("GOOGLE"),
    PLAYSTATION("PLAYSTATION"),
    STADIA("STADIA"),
    STEAM("STEAM"),
    TWITCH("TWITCH"),
    XBOX("XBOX");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class IAPOrderInfoBuilder {
    private String status;
    private String type;

    public IAPOrderInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public IAPOrderInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public IAPOrderInfoBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public IAPOrderInfoBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

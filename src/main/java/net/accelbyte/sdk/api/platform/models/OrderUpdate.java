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
public class OrderUpdate extends Model {

  @JsonProperty("status")
  private String status;

  @JsonProperty("statusReason")
  private String statusReason;

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
  public OrderUpdate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<OrderUpdate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<OrderUpdate>>() {});
  }

  public enum Status {
    CHARGEBACK("CHARGEBACK"),
    CHARGEBACKREVERSED("CHARGEBACK_REVERSED"),
    CHARGED("CHARGED"),
    CLOSED("CLOSED"),
    DELETED("DELETED"),
    FULFILLED("FULFILLED"),
    FULFILLFAILED("FULFILL_FAILED"),
    INIT("INIT"),
    REFUNDED("REFUNDED"),
    REFUNDING("REFUNDING"),
    REFUNDFAILED("REFUND_FAILED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class OrderUpdateBuilder {
    private String status;

    public OrderUpdateBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public OrderUpdateBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

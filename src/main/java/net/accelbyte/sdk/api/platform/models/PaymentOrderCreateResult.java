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
public class PaymentOrderCreateResult extends Model {

  @JsonProperty("createdTime")
  private String createdTime;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("paymentOrderNo")
  private String paymentOrderNo;

  @JsonProperty("paymentStationUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentStationUrl;

  @JsonProperty("status")
  private String status;

  @JsonProperty("targetNamespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String targetNamespace;

  @JsonProperty("targetUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String targetUserId;

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
  public PaymentOrderCreateResult createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PaymentOrderCreateResult> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<PaymentOrderCreateResult>>() {});
  }

  public enum Status {
    AUTHORISED("AUTHORISED"),
    AUTHORISEFAILED("AUTHORISE_FAILED"),
    CHARGEBACK("CHARGEBACK"),
    CHARGEBACKREVERSED("CHARGEBACK_REVERSED"),
    CHARGED("CHARGED"),
    CHARGEFAILED("CHARGE_FAILED"),
    DELETED("DELETED"),
    INIT("INIT"),
    NOTIFICATIONOFCHARGEBACK("NOTIFICATION_OF_CHARGEBACK"),
    REFUNDED("REFUNDED"),
    REFUNDING("REFUNDING"),
    REFUNDFAILED("REFUND_FAILED"),
    REQUESTFORINFORMATION("REQUEST_FOR_INFORMATION");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PaymentOrderCreateResultBuilder {
    private String status;

    public PaymentOrderCreateResultBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public PaymentOrderCreateResultBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

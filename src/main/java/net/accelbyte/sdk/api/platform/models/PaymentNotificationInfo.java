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
public class PaymentNotificationInfo extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("externalId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String externalId;

  @JsonProperty("id")
  private String id;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("notification")
  private Map<String, ?> notification;

  @JsonProperty("notificationSource")
  private String notificationSource;

  @JsonProperty("notificationType")
  private String notificationType;

  @JsonProperty("paymentOrderNo")
  private String paymentOrderNo;

  @JsonProperty("status")
  private String status;

  @JsonProperty("statusReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String statusReason;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public String getNotificationSource() {
    return this.notificationSource;
  }

  @JsonIgnore
  public NotificationSource getNotificationSourceAsEnum() {
    return NotificationSource.valueOf(this.notificationSource);
  }

  @JsonIgnore
  public void setNotificationSource(final String notificationSource) {
    this.notificationSource = notificationSource;
  }

  @JsonIgnore
  public void setNotificationSourceFromEnum(final NotificationSource notificationSource) {
    this.notificationSource = notificationSource.toString();
  }

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
  public PaymentNotificationInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PaymentNotificationInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<PaymentNotificationInfo>>() {});
  }

  public enum NotificationSource {
    ADYEN("ADYEN"),
    ALIPAY("ALIPAY"),
    CHECKOUT("CHECKOUT"),
    PAYPAL("PAYPAL"),
    STRIPE("STRIPE"),
    WALLET("WALLET"),
    WXPAY("WXPAY"),
    XSOLLA("XSOLLA");

    private String value;

    NotificationSource(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    ERROR("ERROR"),
    IGNORED("IGNORED"),
    PROCESSED("PROCESSED"),
    WARN("WARN");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PaymentNotificationInfoBuilder {
    private String notificationSource;
    private String status;

    public PaymentNotificationInfoBuilder notificationSource(final String notificationSource) {
      this.notificationSource = notificationSource;
      return this;
    }

    public PaymentNotificationInfoBuilder notificationSourceFromEnum(
        final NotificationSource notificationSource) {
      this.notificationSource = notificationSource.toString();
      return this;
    }

    public PaymentNotificationInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public PaymentNotificationInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

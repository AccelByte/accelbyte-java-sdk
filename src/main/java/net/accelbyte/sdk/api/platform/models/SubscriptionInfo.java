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
public class SubscriptionInfo extends Model {

  @JsonProperty("billingAccount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private BillingAccount billingAccount;

  @JsonProperty("chargeStatus")
  private String chargeStatus;

  @JsonProperty("chargedCycles")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer chargedCycles;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("currency")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CurrencySummary currency;

  @JsonProperty("currentCycle")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer currentCycle;

  @JsonProperty("currentPeriodEnd")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String currentPeriodEnd;

  @JsonProperty("currentPeriodStart")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String currentPeriodStart;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("end")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String end;

  @JsonProperty("entitlements")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<EntitlementSummary> entitlements;

  @JsonProperty("firstSubscribe")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean firstSubscribe;

  @JsonProperty("id")
  private String id;

  @JsonProperty("inFixedCycleTrial")
  private Boolean inFixedCycleTrial;

  @JsonProperty("inFixedFreeDays")
  private Boolean inFixedFreeDays;

  @JsonProperty("itemId")
  private String itemId;

  @JsonProperty("itemSnapshot")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ItemSnapshot itemSnapshot;

  @JsonProperty("language")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String language;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("nextBillingDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String nextBillingDate;

  @JsonProperty("paid")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean paid;

  @JsonProperty("paymentFlowRequired")
  private Boolean paymentFlowRequired;

  @JsonProperty("paymentOrderNo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentOrderNo;

  @JsonProperty("paymentStationUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentStationUrl;

  @JsonProperty("price")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer price;

  @JsonProperty("recurring")
  private Recurring recurring;

  @JsonProperty("region")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String region;

  @JsonProperty("retryAttempted")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer retryAttempted;

  @JsonProperty("returnUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String returnUrl;

  @JsonProperty("sandbox")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean sandbox;

  @JsonProperty("sku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sku;

  @JsonProperty("source")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String source;

  @JsonProperty("start")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String start;

  @JsonProperty("status")
  private String status;

  @JsonProperty("subscribedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String subscribedAt;

  @JsonProperty("subscribedBy")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String subscribedBy;

  @JsonProperty("title")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String title;

  @JsonProperty("trialPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer trialPrice;

  @JsonProperty("trialedCycles")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer trialedCycles;

  @JsonProperty("unsubscribeReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String unsubscribeReason;

  @JsonProperty("unsubscribedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String unsubscribedAt;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public String getChargeStatus() {
    return this.chargeStatus;
  }

  @JsonIgnore
  public ChargeStatus getChargeStatusAsEnum() {
    return ChargeStatus.valueOf(this.chargeStatus);
  }

  @JsonIgnore
  public void setChargeStatus(final String chargeStatus) {
    this.chargeStatus = chargeStatus;
  }

  @JsonIgnore
  public void setChargeStatusFromEnum(final ChargeStatus chargeStatus) {
    this.chargeStatus = chargeStatus.toString();
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
  public String getSubscribedBy() {
    return this.subscribedBy;
  }

  @JsonIgnore
  public SubscribedBy getSubscribedByAsEnum() {
    return SubscribedBy.valueOf(this.subscribedBy);
  }

  @JsonIgnore
  public void setSubscribedBy(final String subscribedBy) {
    this.subscribedBy = subscribedBy;
  }

  @JsonIgnore
  public void setSubscribedByFromEnum(final SubscribedBy subscribedBy) {
    this.subscribedBy = subscribedBy.toString();
  }

  @JsonIgnore
  public SubscriptionInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<SubscriptionInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<SubscriptionInfo>>() {});
  }

  public enum ChargeStatus {
    CHARGED("CHARGED"),
    CHARGEFAILED("CHARGE_FAILED"),
    NEVER("NEVER"),
    RECURRINGCHARGING("RECURRING_CHARGING"),
    SETUP("SETUP");

    private String value;

    ChargeStatus(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    ACTIVE("ACTIVE"),
    CANCELLED("CANCELLED"),
    EXPIRED("EXPIRED"),
    INIT("INIT");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum SubscribedBy {
    PLATFORM("PLATFORM"),
    USER("USER");

    private String value;

    SubscribedBy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class SubscriptionInfoBuilder {
    private String chargeStatus;
    private String status;
    private String subscribedBy;

    public SubscriptionInfoBuilder chargeStatus(final String chargeStatus) {
      this.chargeStatus = chargeStatus;
      return this;
    }

    public SubscriptionInfoBuilder chargeStatusFromEnum(final ChargeStatus chargeStatus) {
      this.chargeStatus = chargeStatus.toString();
      return this;
    }

    public SubscriptionInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public SubscriptionInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public SubscriptionInfoBuilder subscribedBy(final String subscribedBy) {
      this.subscribedBy = subscribedBy;
      return this;
    }

    public SubscriptionInfoBuilder subscribedByFromEnum(final SubscribedBy subscribedBy) {
      this.subscribedBy = subscribedBy.toString();
      return this;
    }
  }
}

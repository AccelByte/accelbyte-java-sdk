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
public class ThirdPartyUserSubscriptionInfo extends Model {

  @JsonProperty("active")
  private Boolean active;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("expiredAt")
  private String expiredAt;

  @JsonProperty("id")
  private String id;

  @JsonProperty("lastTransactionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String lastTransactionId;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("platform")
  private String platform;

  @JsonProperty("startAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String startAt;

  @JsonProperty("status")
  private String status;

  @JsonProperty("subscriptionGroupId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String subscriptionGroupId;

  @JsonProperty("subscriptionProductId")
  private String subscriptionProductId;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public String getPlatform() {
    return this.platform;
  }

  @JsonIgnore
  public Platform getPlatformAsEnum() {
    return Platform.valueOf(this.platform);
  }

  @JsonIgnore
  public void setPlatform(final String platform) {
    this.platform = platform;
  }

  @JsonIgnore
  public void setPlatformFromEnum(final Platform platform) {
    this.platform = platform.toString();
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
  public ThirdPartyUserSubscriptionInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ThirdPartyUserSubscriptionInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ThirdPartyUserSubscriptionInfo>>() {});
  }

  public enum Platform {
    APPLE("APPLE"),
    EPICGAMES("EPICGAMES"),
    GOOGLE("GOOGLE"),
    OCULUS("OCULUS"),
    PLAYSTATION("PLAYSTATION"),
    STADIA("STADIA"),
    STEAM("STEAM"),
    TWITCH("TWITCH"),
    XBOX("XBOX");

    private String value;

    Platform(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    ACTIVE("ACTIVE"),
    BILLINGRETRYPERIOD("BILLING_RETRY_PERIOD"),
    CANCELED("CANCELED"),
    EXPIRED("EXPIRED"),
    INGRACEPERIOD("IN_GRACE_PERIOD"),
    ONHOLD("ON_HOLD"),
    PAUSED("PAUSED"),
    PENDING("PENDING"),
    REVOKED("REVOKED"),
    UNKNOWN("UNKNOWN");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ThirdPartyUserSubscriptionInfoBuilder {
    private String platform;
    private String status;

    public ThirdPartyUserSubscriptionInfoBuilder platform(final String platform) {
      this.platform = platform;
      return this;
    }

    public ThirdPartyUserSubscriptionInfoBuilder platformFromEnum(final Platform platform) {
      this.platform = platform.toString();
      return this;
    }

    public ThirdPartyUserSubscriptionInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public ThirdPartyUserSubscriptionInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

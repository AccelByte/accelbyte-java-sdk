/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SubscriptionSummary extends Model {

  @JsonProperty("currentPeriodEnd")
  private String currentPeriodEnd;

  @JsonProperty("currentPeriodStart")
  private String currentPeriodStart;

  @JsonProperty("id")
  private String id;

  @JsonProperty("itemId")
  private String itemId;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("sku")
  private String sku;

  @JsonProperty("status")
  private String status;

  @JsonProperty("subscribedBy")
  private String subscribedBy;

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
  public SubscriptionSummary createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<SubscriptionSummary> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<SubscriptionSummary>>() {});
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

  public static class SubscriptionSummaryBuilder {
    private String status;
    private String subscribedBy;

    public SubscriptionSummaryBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public SubscriptionSummaryBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public SubscriptionSummaryBuilder subscribedBy(final String subscribedBy) {
      this.subscribedBy = subscribedBy;
      return this;
    }

    public SubscriptionSummaryBuilder subscribedByFromEnum(final SubscribedBy subscribedBy) {
      this.subscribedBy = subscribedBy.toString();
      return this;
    }
  }
}

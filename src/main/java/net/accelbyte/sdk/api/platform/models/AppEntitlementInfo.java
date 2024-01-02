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
public class AppEntitlementInfo extends Model {

  @JsonProperty("appId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appId;

  @JsonProperty("appType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appType;

  @JsonProperty("endDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String endDate;

  @JsonProperty("grantedAt")
  private String grantedAt;

  @JsonProperty("itemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemId;

  @JsonProperty("itemSnapshot")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ItemSnapshot itemSnapshot;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("noOrigin")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean noOrigin;

  @JsonProperty("origin")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String origin;

  @JsonProperty("sku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sku;

  @JsonProperty("startDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String startDate;

  @JsonProperty("status")
  private String status;

  @JsonProperty("storeId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String storeId;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public String getAppType() {
    return this.appType;
  }

  @JsonIgnore
  public AppType getAppTypeAsEnum() {
    return AppType.valueOf(this.appType);
  }

  @JsonIgnore
  public void setAppType(final String appType) {
    this.appType = appType;
  }

  @JsonIgnore
  public void setAppTypeFromEnum(final AppType appType) {
    this.appType = appType.toString();
  }

  @JsonIgnore
  public String getOrigin() {
    return this.origin;
  }

  @JsonIgnore
  public Origin getOriginAsEnum() {
    return Origin.valueOf(this.origin);
  }

  @JsonIgnore
  public void setOrigin(final String origin) {
    this.origin = origin;
  }

  @JsonIgnore
  public void setOriginFromEnum(final Origin origin) {
    this.origin = origin.toString();
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
  public AppEntitlementInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<AppEntitlementInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<AppEntitlementInfo>>() {});
  }

  public enum AppType {
    DEMO("DEMO"),
    DLC("DLC"),
    GAME("GAME"),
    SOFTWARE("SOFTWARE");

    private String value;

    AppType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Origin {
    Epic("Epic"),
    GooglePlay("GooglePlay"),
    IOS("IOS"),
    Nintendo("Nintendo"),
    Oculus("Oculus"),
    Other("Other"),
    Playstation("Playstation"),
    Steam("Steam"),
    System("System"),
    Twitch("Twitch"),
    Xbox("Xbox");

    private String value;

    Origin(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    ACTIVE("ACTIVE"),
    CONSUMED("CONSUMED"),
    INACTIVE("INACTIVE"),
    REVOKED("REVOKED"),
    SOLD("SOLD");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AppEntitlementInfoBuilder {
    private String appType;
    private String origin;
    private String status;

    public AppEntitlementInfoBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public AppEntitlementInfoBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public AppEntitlementInfoBuilder origin(final String origin) {
      this.origin = origin;
      return this;
    }

    public AppEntitlementInfoBuilder originFromEnum(final Origin origin) {
      this.origin = origin.toString();
      return this;
    }

    public AppEntitlementInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public AppEntitlementInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}

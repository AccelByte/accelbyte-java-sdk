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
public class EntitlementInfo extends Model {

  @JsonProperty("appId")
  private String appId;

  @JsonProperty("appType")
  private String appType;

  @JsonProperty("clazz")
  private String clazz;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("endDate")
  private String endDate;

  @JsonProperty("features")
  private List<String> features;

  @JsonProperty("grantedAt")
  private String grantedAt;

  @JsonProperty("grantedCode")
  private String grantedCode;

  @JsonProperty("id")
  private String id;

  @JsonProperty("itemId")
  private String itemId;

  @JsonProperty("itemNamespace")
  private String itemNamespace;

  @JsonProperty("itemSnapshot")
  private ItemSnapshot itemSnapshot;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("sku")
  private String sku;

  @JsonProperty("source")
  private String source;

  @JsonProperty("stackable")
  private Boolean stackable;

  @JsonProperty("startDate")
  private String startDate;

  @JsonProperty("status")
  private String status;

  @JsonProperty("storeId")
  private String storeId;

  @JsonProperty("type")
  private String type;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("useCount")
  private Integer useCount;

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
  public String getClazz() {
    return this.clazz;
  }

  @JsonIgnore
  public Clazz getClazzAsEnum() {
    return Clazz.valueOf(this.clazz);
  }

  @JsonIgnore
  public void setClazz(final String clazz) {
    this.clazz = clazz;
  }

  @JsonIgnore
  public void setClazzFromEnum(final Clazz clazz) {
    this.clazz = clazz.toString();
  }

  @JsonIgnore
  public String getSource() {
    return this.source;
  }

  @JsonIgnore
  public Source getSourceAsEnum() {
    return Source.valueOf(this.source);
  }

  @JsonIgnore
  public void setSource(final String source) {
    this.source = source;
  }

  @JsonIgnore
  public void setSourceFromEnum(final Source source) {
    this.source = source.toString();
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
  public EntitlementInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<EntitlementInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementInfo>>() {});
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

  public enum Clazz {
    APP("APP"),
    CODE("CODE"),
    ENTITLEMENT("ENTITLEMENT"),
    MEDIA("MEDIA"),
    SUBSCRIPTION("SUBSCRIPTION");

    private String value;

    Clazz(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Source {
    ACHIEVEMENT("ACHIEVEMENT"),
    GIFT("GIFT"),
    IAP("IAP"),
    OTHER("OTHER"),
    PROMOTION("PROMOTION"),
    PURCHASE("PURCHASE"),
    REDEEMCODE("REDEEM_CODE"),
    REFERRALBONUS("REFERRAL_BONUS"),
    REWARD("REWARD");

    private String value;

    Source(String value) {
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

  public enum Type {
    CONSUMABLE("CONSUMABLE"),
    DURABLE("DURABLE");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class EntitlementInfoBuilder {
    private String appType;
    private String clazz;
    private String source;
    private String status;
    private String type;

    public EntitlementInfoBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public EntitlementInfoBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public EntitlementInfoBuilder clazz(final String clazz) {
      this.clazz = clazz;
      return this;
    }

    public EntitlementInfoBuilder clazzFromEnum(final Clazz clazz) {
      this.clazz = clazz.toString();
      return this;
    }

    public EntitlementInfoBuilder source(final String source) {
      this.source = source;
      return this;
    }

    public EntitlementInfoBuilder sourceFromEnum(final Source source) {
      this.source = source.toString();
      return this;
    }

    public EntitlementInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public EntitlementInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public EntitlementInfoBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public EntitlementInfoBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

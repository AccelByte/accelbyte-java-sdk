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
public class EntitlementDecrementResult extends Model {

  @JsonProperty("appId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appId;

  @JsonProperty("appType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appType;

  @JsonProperty("clazz")
  private String clazz;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("endDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String endDate;

  @JsonProperty("features")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> features;

  @JsonProperty("grantedAt")
  private String grantedAt;

  @JsonProperty("grantedCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String grantedCode;

  @JsonProperty("id")
  private String id;

  @JsonProperty("itemId")
  private String itemId;

  @JsonProperty("itemNamespace")
  private String itemNamespace;

  @JsonProperty("itemSnapshot")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private ItemSnapshot itemSnapshot;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("replayed")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean replayed;

  @JsonProperty("requestId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String requestId;

  @JsonProperty("rewards")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<EntitlementLootBoxReward> rewards;

  @JsonProperty("sku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sku;

  @JsonProperty("source")
  private String source;

  @JsonProperty("stackable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean stackable;

  @JsonProperty("startDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String startDate;

  @JsonProperty("status")
  private String status;

  @JsonProperty("storeId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String storeId;

  @JsonProperty("type")
  private String type;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("useCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
  public EntitlementDecrementResult createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<EntitlementDecrementResult> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<EntitlementDecrementResult>>() {});
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
    LOOTBOX("LOOTBOX"),
    MEDIA("MEDIA"),
    OPTIONBOX("OPTIONBOX"),
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

  public static class EntitlementDecrementResultBuilder {
    private String appType;
    private String clazz;
    private String source;
    private String status;
    private String type;

    public EntitlementDecrementResultBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public EntitlementDecrementResultBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public EntitlementDecrementResultBuilder clazz(final String clazz) {
      this.clazz = clazz;
      return this;
    }

    public EntitlementDecrementResultBuilder clazzFromEnum(final Clazz clazz) {
      this.clazz = clazz.toString();
      return this;
    }

    public EntitlementDecrementResultBuilder source(final String source) {
      this.source = source;
      return this;
    }

    public EntitlementDecrementResultBuilder sourceFromEnum(final Source source) {
      this.source = source.toString();
      return this;
    }

    public EntitlementDecrementResultBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public EntitlementDecrementResultBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public EntitlementDecrementResultBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public EntitlementDecrementResultBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

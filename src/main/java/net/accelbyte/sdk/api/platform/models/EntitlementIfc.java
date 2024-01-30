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
public class EntitlementIfc extends Model {

  @JsonProperty("appId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appId;

  @JsonProperty("appType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appType;

  @JsonProperty("clazz")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String clazz;

  @JsonProperty("collectionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String collectionId;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("endDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String endDate;

  @JsonProperty("features")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> features;

  @JsonProperty("grantedCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String grantedCode;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("itemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemId;

  @JsonProperty("itemNamespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemNamespace;

  @JsonProperty("name")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String name;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("storeId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String storeId;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonProperty("useCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer useCount;

  @JsonProperty("userId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
  public EntitlementIfc createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<EntitlementIfc> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementIfc>>() {});
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

  public static class EntitlementIfcBuilder {
    private String appType;
    private String clazz;
    private String origin;
    private String status;
    private String type;

    public EntitlementIfcBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public EntitlementIfcBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public EntitlementIfcBuilder clazz(final String clazz) {
      this.clazz = clazz;
      return this;
    }

    public EntitlementIfcBuilder clazzFromEnum(final Clazz clazz) {
      this.clazz = clazz.toString();
      return this;
    }

    public EntitlementIfcBuilder origin(final String origin) {
      this.origin = origin;
      return this;
    }

    public EntitlementIfcBuilder originFromEnum(final Origin origin) {
      this.origin = origin.toString();
      return this;
    }

    public EntitlementIfcBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public EntitlementIfcBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public EntitlementIfcBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public EntitlementIfcBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

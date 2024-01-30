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
public class EntitlementSummary extends Model {

  @JsonProperty("clazz")
  private String clazz;

  @JsonProperty("collectionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String collectionId;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("endDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String endDate;

  @JsonProperty("grantedCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String grantedCode;

  @JsonProperty("id")
  private String id;

  @JsonProperty("itemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemId;

  @JsonProperty("name")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("noOrigin")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean noOrigin;

  @JsonProperty("origin")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String origin;

  @JsonProperty("stackable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean stackable;

  @JsonProperty("stackedUseCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer stackedUseCount;

  @JsonProperty("startDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String startDate;

  @JsonProperty("storeId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String storeId;

  @JsonProperty("type")
  private String type;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userId")
  private String userId;

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
  public EntitlementSummary createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<EntitlementSummary> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementSummary>>() {});
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

  public static class EntitlementSummaryBuilder {
    private String clazz;
    private String origin;
    private String type;

    public EntitlementSummaryBuilder clazz(final String clazz) {
      this.clazz = clazz;
      return this;
    }

    public EntitlementSummaryBuilder clazzFromEnum(final Clazz clazz) {
      this.clazz = clazz.toString();
      return this;
    }

    public EntitlementSummaryBuilder origin(final String origin) {
      this.origin = origin;
      return this;
    }

    public EntitlementSummaryBuilder originFromEnum(final Origin origin) {
      this.origin = origin.toString();
      return this;
    }

    public EntitlementSummaryBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public EntitlementSummaryBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

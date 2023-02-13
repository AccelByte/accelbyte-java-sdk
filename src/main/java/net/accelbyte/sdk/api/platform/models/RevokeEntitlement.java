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
public class RevokeEntitlement extends Model {

  @JsonProperty("clazz")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String clazz;

  @JsonProperty("entitlementId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String entitlementId;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

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
  public RevokeEntitlement createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RevokeEntitlement> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RevokeEntitlement>>() {});
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

  public static class RevokeEntitlementBuilder {
    private String clazz;
    private String type;

    public RevokeEntitlementBuilder clazz(final String clazz) {
      this.clazz = clazz;
      return this;
    }

    public RevokeEntitlementBuilder clazzFromEnum(final Clazz clazz) {
      this.clazz = clazz.toString();
      return this;
    }

    public RevokeEntitlementBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public RevokeEntitlementBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

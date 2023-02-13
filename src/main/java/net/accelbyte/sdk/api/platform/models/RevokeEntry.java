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
public class RevokeEntry extends Model {

  @JsonProperty("currency")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RevokeCurrency currency;

  @JsonProperty("entitlement")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RevokeEntitlement entitlement;

  @JsonProperty("item")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RevokeItem item;

  @JsonProperty("quantity")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer quantity;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

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
  public RevokeEntry createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RevokeEntry> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RevokeEntry>>() {});
  }

  public enum Type {
    CURRENCY("CURRENCY"),
    ENTITLEMENT("ENTITLEMENT"),
    ITEM("ITEM");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class RevokeEntryBuilder {
    private String type;

    public RevokeEntryBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public RevokeEntryBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

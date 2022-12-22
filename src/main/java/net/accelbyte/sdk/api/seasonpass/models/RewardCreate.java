/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class RewardCreate extends Model {

  @JsonProperty("code")
  private String code;

  @JsonProperty("currency")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RewardCurrency currency;

  @JsonProperty("image")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Image image;

  @JsonProperty("itemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemId;

  @JsonProperty("quantity")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer quantity;

  @JsonProperty("type")
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
  public RewardCreate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RewardCreate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RewardCreate>>() {});
  }

  public enum Type {
    CURRENCY("CURRENCY"),
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

  public static class RewardCreateBuilder {
    private String type;

    public RewardCreateBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public RewardCreateBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

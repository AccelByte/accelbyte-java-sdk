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
public class RewardItem extends Model {

  @JsonProperty("duration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer duration;

  @JsonProperty("endDate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String endDate;

  @JsonProperty("identityType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String identityType;

  @JsonProperty("itemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemId;

  @JsonProperty("quantity")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer quantity;

  @JsonProperty("sku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sku;

  @JsonIgnore
  public String getIdentityType() {
    return this.identityType;
  }

  @JsonIgnore
  public IdentityType getIdentityTypeAsEnum() {
    return IdentityType.valueOf(this.identityType);
  }

  @JsonIgnore
  public void setIdentityType(final String identityType) {
    this.identityType = identityType;
  }

  @JsonIgnore
  public void setIdentityTypeFromEnum(final IdentityType identityType) {
    this.identityType = identityType.toString();
  }

  @JsonIgnore
  public RewardItem createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RewardItem> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RewardItem>>() {});
  }

  public enum IdentityType {
    ITEMID("ITEM_ID"),
    ITEMSKU("ITEM_SKU");

    private String value;

    IdentityType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class RewardItemBuilder {
    private String identityType;

    public RewardItemBuilder identityType(final String identityType) {
      this.identityType = identityType;
      return this;
    }

    public RewardItemBuilder identityTypeFromEnum(final IdentityType identityType) {
      this.identityType = identityType.toString();
      return this;
    }
  }
}

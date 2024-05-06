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
public class DeductionDetail extends Model {

  @JsonProperty("deductionType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String deductionType;

  @JsonProperty("discountCodeDeductionDetail")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private DiscountCodeDeductionDetail discountCodeDeductionDetail;

  @JsonIgnore
  public String getDeductionType() {
    return this.deductionType;
  }

  @JsonIgnore
  public DeductionType getDeductionTypeAsEnum() {
    return DeductionType.valueOf(this.deductionType);
  }

  @JsonIgnore
  public void setDeductionType(final String deductionType) {
    this.deductionType = deductionType;
  }

  @JsonIgnore
  public void setDeductionTypeFromEnum(final DeductionType deductionType) {
    this.deductionType = deductionType.toString();
  }

  @JsonIgnore
  public DeductionDetail createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DeductionDetail> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<DeductionDetail>>() {});
  }

  public enum DeductionType {
    DISCOUNTCODE("DISCOUNT_CODE");

    private String value;

    DeductionType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class DeductionDetailBuilder {
    private String deductionType;

    public DeductionDetailBuilder deductionType(final String deductionType) {
      this.deductionType = deductionType;
      return this;
    }

    public DeductionDetailBuilder deductionTypeFromEnum(final DeductionType deductionType) {
      this.deductionType = deductionType.toString();
      return this;
    }
  }
}

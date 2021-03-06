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
public class XblReconcileResult extends Model {

  @JsonProperty("iapOrderStatus")
  private String iapOrderStatus;

  @JsonProperty("itemId")
  private String itemId;

  @JsonProperty("sku")
  private String sku;

  @JsonProperty("transactionId")
  private String transactionId;

  @JsonProperty("xboxProductId")
  private String xboxProductId;

  @JsonIgnore
  public String getIapOrderStatus() {
    return this.iapOrderStatus;
  }

  @JsonIgnore
  public IapOrderStatus getIapOrderStatusAsEnum() {
    return IapOrderStatus.valueOf(this.iapOrderStatus);
  }

  @JsonIgnore
  public void setIapOrderStatus(final String iapOrderStatus) {
    this.iapOrderStatus = iapOrderStatus;
  }

  @JsonIgnore
  public void setIapOrderStatusFromEnum(final IapOrderStatus iapOrderStatus) {
    this.iapOrderStatus = iapOrderStatus.toString();
  }

  @JsonIgnore
  public XblReconcileResult createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<XblReconcileResult> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<XblReconcileResult>>() {});
  }

  public enum IapOrderStatus {
    FAILED("FAILED"),
    FULFILLED("FULFILLED"),
    VERIFIED("VERIFIED");

    private String value;

    IapOrderStatus(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class XblReconcileResultBuilder {
    private String iapOrderStatus;

    public XblReconcileResultBuilder iapOrderStatus(final String iapOrderStatus) {
      this.iapOrderStatus = iapOrderStatus;
      return this;
    }

    public XblReconcileResultBuilder iapOrderStatusFromEnum(final IapOrderStatus iapOrderStatus) {
      this.iapOrderStatus = iapOrderStatus.toString();
      return this;
    }
  }
}

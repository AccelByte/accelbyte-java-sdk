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
public class PaymentProviderConfigInfo extends Model {

  @JsonProperty("aggregate")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String aggregate;

  @JsonProperty("id")
  private String id;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("paymentMerchantConfigId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String paymentMerchantConfigId;

  @JsonProperty("region")
  private String region;

  @JsonProperty("sandboxTaxJarApiToken")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sandboxTaxJarApiToken;

  @JsonProperty("specials")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> specials;

  @JsonProperty("taxJarApiToken")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String taxJarApiToken;

  @JsonProperty("taxJarEnabled")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean taxJarEnabled;

  @JsonProperty("useGlobalTaxJarApiToken")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean useGlobalTaxJarApiToken;

  @JsonIgnore
  public String getAggregate() {
    return this.aggregate;
  }

  @JsonIgnore
  public Aggregate getAggregateAsEnum() {
    return Aggregate.valueOf(this.aggregate);
  }

  @JsonIgnore
  public void setAggregate(final String aggregate) {
    this.aggregate = aggregate;
  }

  @JsonIgnore
  public void setAggregateFromEnum(final Aggregate aggregate) {
    this.aggregate = aggregate.toString();
  }

  @JsonIgnore
  public List<String> getSpecials() {
    return this.specials;
  }

  @JsonIgnore
  public List<Specials> getSpecialsAsEnum() {
    ArrayList<Specials> en = new ArrayList<Specials>();
    for (String e : this.specials) en.add(Specials.valueOf(e));
    return en;
  }

  @JsonIgnore
  public void setSpecials(final List<String> specials) {
    this.specials = specials;
  }

  @JsonIgnore
  public void setSpecialsFromEnum(final List<Specials> specials) {
    ArrayList<String> en = new ArrayList<String>();
    for (Specials e : specials) en.add(e.toString());
    this.specials = en;
  }

  @JsonIgnore
  public PaymentProviderConfigInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PaymentProviderConfigInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<PaymentProviderConfigInfo>>() {});
  }

  public enum Aggregate {
    ADYEN("ADYEN"),
    XSOLLA("XSOLLA");

    private String value;

    Aggregate(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Specials {
    ADYEN("ADYEN"),
    ALIPAY("ALIPAY"),
    CHECKOUT("CHECKOUT"),
    PAYPAL("PAYPAL"),
    STRIPE("STRIPE"),
    WALLET("WALLET"),
    WXPAY("WXPAY"),
    XSOLLA("XSOLLA");

    private String value;

    Specials(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PaymentProviderConfigInfoBuilder {
    private String aggregate;
    private List<String> specials;

    public PaymentProviderConfigInfoBuilder aggregate(final String aggregate) {
      this.aggregate = aggregate;
      return this;
    }

    public PaymentProviderConfigInfoBuilder aggregateFromEnum(final Aggregate aggregate) {
      this.aggregate = aggregate.toString();
      return this;
    }

    public PaymentProviderConfigInfoBuilder specials(final List<String> specials) {
      this.specials = specials;
      return this;
    }

    public PaymentProviderConfigInfoBuilder specialsFromEnum(final List<Specials> specials) {
      ArrayList<String> en = new ArrayList<String>();
      for (Specials e : specials) en.add(e.toString());
      this.specials = en;
      return this;
    }
  }
}

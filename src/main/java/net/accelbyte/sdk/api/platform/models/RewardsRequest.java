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
public class RewardsRequest extends Model {

  @JsonProperty("entitlementOrigin")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String entitlementOrigin;

  @JsonProperty("metadata")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> metadata;

  @JsonProperty("origin")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String origin;

  @JsonProperty("rewards")
  private List<PlatformReward> rewards;

  @JsonProperty("source")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String source;

  @JsonProperty("transactionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String transactionId;

  @JsonIgnore
  public String getEntitlementOrigin() {
    return this.entitlementOrigin;
  }

  @JsonIgnore
  public EntitlementOrigin getEntitlementOriginAsEnum() {
    return EntitlementOrigin.valueOf(this.entitlementOrigin);
  }

  @JsonIgnore
  public void setEntitlementOrigin(final String entitlementOrigin) {
    this.entitlementOrigin = entitlementOrigin;
  }

  @JsonIgnore
  public void setEntitlementOriginFromEnum(final EntitlementOrigin entitlementOrigin) {
    this.entitlementOrigin = entitlementOrigin.toString();
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
  public RewardsRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RewardsRequest> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RewardsRequest>>() {});
  }

  public enum EntitlementOrigin {
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

    EntitlementOrigin(String value) {
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

  public enum Source {
    ACHIEVEMENT("ACHIEVEMENT"),
    CONSUMEENTITLEMENT("CONSUME_ENTITLEMENT"),
    DLC("DLC"),
    EXPIRATION("EXPIRATION"),
    GIFT("GIFT"),
    IAP("IAP"),
    IAPCHARGEBACKREVERSED("IAP_CHARGEBACK_REVERSED"),
    ORDERREVOCATION("ORDER_REVOCATION"),
    OTHER("OTHER"),
    PAYMENT("PAYMENT"),
    PROMOTION("PROMOTION"),
    PURCHASE("PURCHASE"),
    REDEEMCODE("REDEEM_CODE"),
    REFERRALBONUS("REFERRAL_BONUS"),
    REWARD("REWARD"),
    SELLBACK("SELL_BACK");

    private String value;

    Source(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class RewardsRequestBuilder {
    private String entitlementOrigin;
    private String origin;
    private String source;

    public RewardsRequestBuilder entitlementOrigin(final String entitlementOrigin) {
      this.entitlementOrigin = entitlementOrigin;
      return this;
    }

    public RewardsRequestBuilder entitlementOriginFromEnum(
        final EntitlementOrigin entitlementOrigin) {
      this.entitlementOrigin = entitlementOrigin.toString();
      return this;
    }

    public RewardsRequestBuilder origin(final String origin) {
      this.origin = origin;
      return this;
    }

    public RewardsRequestBuilder originFromEnum(final Origin origin) {
      this.origin = origin.toString();
      return this;
    }

    public RewardsRequestBuilder source(final String source) {
      this.source = source;
      return this;
    }

    public RewardsRequestBuilder sourceFromEnum(final Source source) {
      this.source = source.toString();
      return this;
    }
  }
}

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
public class CreditRequest extends Model {

  @JsonProperty("amount")
  private Integer amount;

  @JsonProperty("expireAt")
  private String expireAt;

  @JsonProperty("origin")
  private String origin;

  @JsonProperty("reason")
  private String reason;

  @JsonProperty("source")
  private String source;

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
  public CreditRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<CreditRequest> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<CreditRequest>>() {});
  }

  public enum Origin {
    Epic("Epic"),
    GooglePlay("GooglePlay"),
    IOS("IOS"),
    Nintendo("Nintendo"),
    Other("Other"),
    Playstation("Playstation"),
    Stadia("Stadia"),
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
    DLC("DLC"),
    GIFT("GIFT"),
    IAP("IAP"),
    OTHER("OTHER"),
    PROMOTION("PROMOTION"),
    PURCHASE("PURCHASE"),
    REDEEMCODE("REDEEM_CODE"),
    REFERRALBONUS("REFERRAL_BONUS"),
    REFUND("REFUND"),
    REWARD("REWARD");

    private String value;

    Source(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class CreditRequestBuilder {
    private String origin;
    private String source;

    public CreditRequestBuilder origin(final String origin) {
      this.origin = origin;
      return this;
    }

    public CreditRequestBuilder originFromEnum(final Origin origin) {
      this.origin = origin.toString();
      return this;
    }

    public CreditRequestBuilder source(final String source) {
      this.source = source;
      return this;
    }

    public CreditRequestBuilder sourceFromEnum(final Source source) {
      this.source = source.toString();
      return this;
    }
  }
}

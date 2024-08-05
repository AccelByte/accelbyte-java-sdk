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
public class RevokeFulfillmentV2Result extends Model {

  @JsonProperty("creditRevocations")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<CreditRevocation> creditRevocations;

  @JsonProperty("entitlementRevocations")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<EntitlementRevocation> entitlementRevocations;

  @JsonProperty("id")
  private String id;

  @JsonProperty("itemRevocations")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<ItemRevocation> itemRevocations;

  @JsonProperty("items")
  private List<FulfillmentItem> items;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("state")
  private String state;

  @JsonProperty("stateInfo")
  private FulfillmentStateInfo stateInfo;

  @JsonProperty("transactionId")
  private String transactionId;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public String getState() {
    return this.state;
  }

  @JsonIgnore
  public State getStateAsEnum() {
    return State.valueOf(this.state);
  }

  @JsonIgnore
  public void setState(final String state) {
    this.state = state;
  }

  @JsonIgnore
  public void setStateFromEnum(final State state) {
    this.state = state.toString();
  }

  @JsonIgnore
  public RevokeFulfillmentV2Result createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RevokeFulfillmentV2Result> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<RevokeFulfillmentV2Result>>() {});
  }

  public enum State {
    FULFILLED("FULFILLED"),
    FULFILLFAILED("FULFILL_FAILED"),
    REVOKED("REVOKED"),
    REVOKEFAILED("REVOKE_FAILED");

    private String value;

    State(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class RevokeFulfillmentV2ResultBuilder {
    private String state;

    public RevokeFulfillmentV2ResultBuilder state(final String state) {
      this.state = state;
      return this;
    }

    public RevokeFulfillmentV2ResultBuilder stateFromEnum(final State state) {
      this.state = state.toString();
      return this;
    }
  }
}

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
public class FulfillmentActionHistory extends Model {

  @JsonProperty("action")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String action;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("fulfillmentHistoryId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String fulfillmentHistoryId;

  @JsonProperty("revocationHistoryId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String revocationHistoryId;

  @JsonProperty("state")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String state;

  @JsonIgnore
  public String getAction() {
    return this.action;
  }

  @JsonIgnore
  public Action getActionAsEnum() {
    return Action.valueOf(this.action);
  }

  @JsonIgnore
  public void setAction(final String action) {
    this.action = action;
  }

  @JsonIgnore
  public void setActionFromEnum(final Action action) {
    this.action = action.toString();
  }

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
  public FulfillmentActionHistory createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FulfillmentActionHistory> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<FulfillmentActionHistory>>() {});
  }

  public enum Action {
    FULFILLMENT("FULFILLMENT"),
    REVOKEFULFILLMENT("REVOKE_FULFILLMENT");

    private String value;

    Action(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
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

  public static class FulfillmentActionHistoryBuilder {
    private String action;
    private String state;

    public FulfillmentActionHistoryBuilder action(final String action) {
      this.action = action;
      return this;
    }

    public FulfillmentActionHistoryBuilder actionFromEnum(final Action action) {
      this.action = action.toString();
      return this;
    }

    public FulfillmentActionHistoryBuilder state(final String state) {
      this.state = state;
      return this;
    }

    public FulfillmentActionHistoryBuilder stateFromEnum(final State state) {
      this.state = state.toString();
      return this;
    }
  }
}

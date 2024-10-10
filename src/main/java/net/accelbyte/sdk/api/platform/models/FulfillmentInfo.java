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
public class FulfillmentInfo extends Model {

  @JsonProperty("actions")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<FulfillmentActionHistory> actions;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("id")
  private String id;

  @JsonProperty("items")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<FulfillmentItem> items;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("state")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String state;

  @JsonProperty("stateInfo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private FulfillmentStateInfo stateInfo;

  @JsonProperty("transactionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String transactionId;

  @JsonProperty("updatedAt")
  private String updatedAt;

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
  public FulfillmentInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FulfillmentInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentInfo>>() {});
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

  public static class FulfillmentInfoBuilder {
    private String state;

    public FulfillmentInfoBuilder state(final String state) {
      this.state = state;
      return this;
    }

    public FulfillmentInfoBuilder stateFromEnum(final State state) {
      this.state = state.toString();
      return this;
    }
  }
}

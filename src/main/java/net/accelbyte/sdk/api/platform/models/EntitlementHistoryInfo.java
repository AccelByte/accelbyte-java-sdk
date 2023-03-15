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
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class EntitlementHistoryInfo extends Model {

  @JsonProperty("action")
  private String action;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("entitlementId")
  private String entitlementId;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("operator")
  private String operator;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("useCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer useCount;

  @JsonProperty("userId")
  private String userId;

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
  public EntitlementHistoryInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<EntitlementHistoryInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementHistoryInfo>>() {});
  }

  public enum Action {
    DECREMENT("DECREMENT"),
    DISABLE("DISABLE"),
    ENABLE("ENABLE"),
    GRANT("GRANT"),
    REVOKE("REVOKE"),
    SELLBACK("SELL_BACK"),
    UPDATE("UPDATE");

    private String value;

    Action(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class EntitlementHistoryInfoBuilder {
    private String action;

    public EntitlementHistoryInfoBuilder action(final String action) {
      this.action = action;
      return this;
    }

    public EntitlementHistoryInfoBuilder actionFromEnum(final Action action) {
      this.action = action.toString();
      return this;
    }
  }
}

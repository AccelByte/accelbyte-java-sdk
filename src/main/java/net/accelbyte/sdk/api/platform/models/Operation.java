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
public class Operation extends Model {

  @JsonProperty("creditPayload")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CreditPayload creditPayload;

  @JsonProperty("debitPayload")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private DebitPayload debitPayload;

  @JsonProperty("fulFillItemPayload")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private FulFillItemPayload fulFillItemPayload;

  @JsonProperty("resultId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String resultId;

  @JsonProperty("revokeEntitlementPayload")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RevokeEntitlementPayload revokeEntitlementPayload;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("statusReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String statusReason;

  @JsonProperty("type")
  private String type;

  @JsonIgnore
  public String getStatus() {
    return this.status;
  }

  @JsonIgnore
  public Status getStatusAsEnum() {
    return Status.valueOf(this.status);
  }

  @JsonIgnore
  public void setStatus(final String status) {
    this.status = status;
  }

  @JsonIgnore
  public void setStatusFromEnum(final Status status) {
    this.status = status.toString();
  }

  @JsonIgnore
  public String getType() {
    return this.type;
  }

  @JsonIgnore
  public Type getTypeAsEnum() {
    return Type.valueOf(this.type);
  }

  @JsonIgnore
  public void setType(final String type) {
    this.type = type;
  }

  @JsonIgnore
  public void setTypeFromEnum(final Type type) {
    this.type = type.toString();
  }

  @JsonIgnore
  public Operation createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<Operation> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<Operation>>() {});
  }

  public enum Status {
    FAILED("FAILED"),
    INIT("INIT"),
    SKIPPED("SKIPPED"),
    SUCCESS("SUCCESS");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Type {
    CREDITWALLET("CREDIT_WALLET"),
    DEBITWALLET("DEBIT_WALLET"),
    FULFILLITEM("FULFILL_ITEM"),
    REVOKEENTITLEMENT("REVOKE_ENTITLEMENT");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class OperationBuilder {
    private String status;
    private String type;

    public OperationBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public OperationBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public OperationBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public OperationBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

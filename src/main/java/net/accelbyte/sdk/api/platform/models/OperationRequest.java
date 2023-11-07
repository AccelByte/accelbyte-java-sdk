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
public class OperationRequest extends Model {

  @JsonProperty("creditPayload")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private CreditPayload creditPayload;

  @JsonProperty("debitPayload")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private DebitPayload debitPayload;

  @JsonProperty("fulFillItemPayload")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private FulFillItemPayload fulFillItemPayload;

  @JsonProperty("revokeEntitlementPayload")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RevokeEntitlementPayload revokeEntitlementPayload;

  @JsonProperty("type")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String type;

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
  public OperationRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<OperationRequest> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<OperationRequest>>() {});
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

  public static class OperationRequestBuilder {
    private String type;

    public OperationRequestBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public OperationRequestBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

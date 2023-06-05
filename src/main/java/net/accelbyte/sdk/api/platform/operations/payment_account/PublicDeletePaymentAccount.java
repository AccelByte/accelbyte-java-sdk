/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_account;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicDeletePaymentAccount
 *
 * <p>Delete payment account. Other detail info:
 *
 * <p>* Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:PAYMENT:ACCOUNT",
 * action=8 (DELETE) * Returns :
 */
@Getter
@Setter
public class PublicDeletePaymentAccount extends Operation {
  /** generated field's value */
  private String path =
      "/platform/public/namespaces/{namespace}/users/{userId}/payment/accounts/{type}/{id}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String id;

  private String namespace;
  private String type;
  private String userId;

  /**
   * @param id required
   * @param namespace required
   * @param type required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicDeletePaymentAccount(String id, String namespace, String type, String userId) {
    this.id = id;
    this.namespace = namespace;
    this.type = type;
    this.userId = userId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.id != null) {
      pathParams.put("id", this.id);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.type != null) {
      pathParams.put("type", this.type);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.id == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.type == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }

  public enum Type {
    Card("card"),
    Paypal("paypal");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PublicDeletePaymentAccountBuilder {
    private String type;

    public PublicDeletePaymentAccountBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public PublicDeletePaymentAccountBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

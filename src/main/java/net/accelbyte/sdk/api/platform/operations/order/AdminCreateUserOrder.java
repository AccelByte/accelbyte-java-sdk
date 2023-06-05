/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.order;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminCreateUserOrder
 *
 * <p>Admin Create an order. The result contains the checkout link and payment token. User with
 * permission SANDBOX will create sandbox order that not real paid for xsolla/alipay and not
 * validate price for wxpay. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:ORDER", action=1
 * (CREATE) * It will be forbidden while the user is banned: ORDER_INITIATE or ORDER_AND_PAYMENT *
 * sandbox default value is false * platform default value is Other * Returns : created order
 *
 * <p>## Restrictions for ext field
 *
 * <p>1. Cannot use "." as the key name -
 *
 * <p>{ "data.2": "value" }
 *
 * <p>2. Cannot use "$" as the prefix in key names -
 *
 * <p>{ "$data": "value" }
 */
@Getter
@Setter
public class AdminCreateUserOrder extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/users/{userId}/orders";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private AdminOrderCreate body;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminCreateUserOrder(String namespace, String userId, AdminOrderCreate body) {
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public AdminOrderCreate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public OrderInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OrderInfo().createFromJson(json);
  }
}

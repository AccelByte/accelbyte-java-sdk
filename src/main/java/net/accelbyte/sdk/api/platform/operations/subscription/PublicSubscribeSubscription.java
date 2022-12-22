/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.subscription;

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
 * publicSubscribeSubscription
 *
 * <p>Subscribe a subscription. Support both real and virtual payment. Need go through payment flow
 * using the paymentOrderNo if paymentFlowRequired true. ACTIVE USER subscription can't do subscribe
 * again. The next billing date will be X(default 4) hours before the current period ends if
 * correctly subscribed. User with permission SANDBOX will create sandbox subscription that not real
 * paid. Other detail info:
 *
 * <p>* Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:SUBSCRIPTION", action=1
 * (CREATE) * Optional permission(user with this permission will create sandbox subscription) :
 * resource="SANDBOX", action=1 (CREATE) * It will be forbidden while the user is banned:
 * ORDER_INITIATE or ORDER_AND_PAYMENT * Returns : created subscription
 */
@Getter
@Setter
public class PublicSubscribeSubscription extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/users/{userId}/subscriptions";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private SubscribeRequest body;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicSubscribeSubscription(String namespace, String userId, SubscribeRequest body) {
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
  public SubscribeRequest getBodyParams() {
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

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

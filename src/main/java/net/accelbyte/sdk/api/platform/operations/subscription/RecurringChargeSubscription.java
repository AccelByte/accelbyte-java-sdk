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
 * recurringChargeSubscription
 *
 * <p>[TEST FACILITY ONLY] Forbidden in live environment. Recurring charge subscription, it will
 * trigger recurring charge if the USER subscription status is ACTIVE, nextBillingDate is before now
 * and no fail recurring charge within X(default 12) hours. Other detail info:
 *
 * <p>* Returns : recurring charge result
 */
@Getter
@Setter
public class RecurringChargeSubscription extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/subscriptions/{subscriptionId}/recurring";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String subscriptionId;

  /**
   * @param namespace required
   * @param subscriptionId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RecurringChargeSubscription(String namespace, String subscriptionId) {
    this.namespace = namespace;
    this.subscriptionId = subscriptionId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.subscriptionId != null) {
      pathParams.put("subscriptionId", this.subscriptionId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.subscriptionId == null) {
      return false;
    }
    return true;
  }

  public RecurringChargeResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new RecurringChargeResult().createFromJson(json);
  }
}

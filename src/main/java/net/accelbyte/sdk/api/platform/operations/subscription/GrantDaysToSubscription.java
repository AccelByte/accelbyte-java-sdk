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
 * grantDaysToSubscription
 *
 * <p>Grant days to a subscription, if grantDays is positive, it will add free days and push the
 * next billing date by the amount of day. if the grantDays is negative or zero, it only apply to
 * active/cancelled subscription, remove days will decrease current period end, and move the next
 * billing date closer. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:SUBSCRIPTION",
 * action=4 (UPDATE) * Returns : updated subscription
 */
@Getter
@Setter
public class GrantDaysToSubscription extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}/grant";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String subscriptionId;
  private String userId;
  private GrantSubscriptionDaysRequest body;

  /**
   * @param namespace required
   * @param subscriptionId required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GrantDaysToSubscription(
      String namespace, String subscriptionId, String userId, GrantSubscriptionDaysRequest body) {
    this.namespace = namespace;
    this.subscriptionId = subscriptionId;
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
    if (this.subscriptionId != null) {
      pathParams.put("subscriptionId", this.subscriptionId);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public GrantSubscriptionDaysRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.subscriptionId == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public SubscriptionInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new SubscriptionInfo().createFromJson(json);
  }
}

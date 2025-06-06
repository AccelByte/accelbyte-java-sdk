/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.notification_subscription;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * DeleteSubscriptionAppNotificationV2
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:APP:ALERT:SUBSCRIPTION [DELETE]`
 *
 * <p>Remove a user from the notification subscription.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class DeleteSubscriptionAppNotificationV2 extends Operation {
  /** generated field's value */
  private String path =
      "/csm/v2/admin/namespaces/{namespace}/apps/{app}/subscriptions/{subscriptionId}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String app;

  private String namespace;
  private String subscriptionId;

  /**
   * @param app required
   * @param namespace required
   * @param subscriptionId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteSubscriptionAppNotificationV2(String app, String namespace, String subscriptionId) {
    this.app = app;
    this.namespace = namespace;
    this.subscriptionId = subscriptionId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.app != null) {
      pathParams.put("app", this.app);
    }
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
    if (this.app == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.subscriptionId == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

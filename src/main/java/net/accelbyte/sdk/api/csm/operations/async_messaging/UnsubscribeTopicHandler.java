/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.async_messaging;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * UnsubscribeTopicHandler
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:ASYNCMESSAGING:SUBSCRIPTIONS
 * [DELETE]`
 *
 * <p>Unsubscribe App queue from a topic by Topic Name.
 */
@Getter
@Setter
public class UnsubscribeTopicHandler extends Operation {
  /** generated field's value */
  private String path =
      "/csm/v2/admin/namespaces/{namespace}/apps/{app}/asyncmessaging/topics/{topicName}/subscriptions";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String app;

  private String namespace;
  private String topicName;

  /**
   * @param app required
   * @param namespace required
   * @param topicName required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UnsubscribeTopicHandler(String app, String namespace, String topicName) {
    this.app = app;
    this.namespace = namespace;
    this.topicName = topicName;

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
    if (this.topicName != null) {
      pathParams.put("topicName", this.topicName);
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
    if (this.topicName == null) {
      return false;
    }
    return true;
  }

  public ApimodelTopicSubscription parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelTopicSubscription().createFromJson(json);
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.notification;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getNotificationTopicV1Admin
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:NOTIFICATION [READ]` with scope `social`
 *
 * <p>get topic information by topic name.
 *
 * <p>Action Code: 50215
 */
@Getter
@Setter
public class GetNotificationTopicV1Admin extends Operation {
  /** generated field's value */
  private String path = "/lobby/v1/admin/notification/namespaces/{namespace}/topics/{topicName}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String topicName;

  /**
   * @param namespace required
   * @param topicName required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetNotificationTopicV1Admin(String namespace, String topicName) {
    this.namespace = namespace;
    this.topicName = topicName;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
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
    if (this.namespace == null) {
      return false;
    }
    if (this.topicName == null) {
      return false;
    }
    return true;
  }

  public ModelNotificationTopicResponseV1 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelNotificationTopicResponseV1().createFromJson(json);
  }
}

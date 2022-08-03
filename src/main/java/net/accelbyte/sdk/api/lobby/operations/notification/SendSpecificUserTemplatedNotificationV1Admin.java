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
 * sendSpecificUserTemplatedNotificationV1Admin
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:NOTIFICATION [CREATE]` with scope `social`
 *
 * <p>Sends templated notification to a user.
 *
 * <p>In the request body, specify which template slug (template identifier) to use and the template
 * language.
 *
 * <p>NotificationTemplate context is the key-value pair defining the value of each handlebar
 * specified in the template content. Template need to be published before it can be use to send
 * notifications
 *
 * <p>Action Code: 50212
 */
@Getter
@Setter
public class SendSpecificUserTemplatedNotificationV1Admin extends Operation {
  /** generated field's value */
  private String path =
      "/lobby/v1/admin/notification/namespaces/{namespace}/users/{userId}/templates/notify";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private ModelNotificationWithTemplateRequestV1 body;

  /**
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  public SendSpecificUserTemplatedNotificationV1Admin(
      String namespace, String userId, ModelNotificationWithTemplateRequestV1 body) {
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
  public ModelNotificationWithTemplateRequestV1 getBodyParams() {
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
    if (code != 204) {
      String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

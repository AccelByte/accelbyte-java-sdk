/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminResetPasswordV2
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/admin/namespaces/{namespace}/users/{userId}/password [PUT]
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:PASSWORD:USER:{userId} [UPDATE]'
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class AdminResetPasswordV2 extends Operation {
  /** generated field's value */
  private String path = "/iam/v2/admin/namespaces/{namespace}/users/{userId}/password";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private ModelUserPasswordUpdateRequest body;

  /**
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminResetPasswordV2(
      String namespace, String userId, ModelUserPasswordUpdateRequest body) {
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
  public ModelUserPasswordUpdateRequest getBodyParams() {
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
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

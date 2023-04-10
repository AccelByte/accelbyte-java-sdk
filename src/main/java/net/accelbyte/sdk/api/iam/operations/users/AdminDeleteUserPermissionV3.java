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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminDeleteUserPermissionV3
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:PERMISSION:USER:{userId} [DELETE]'
 */
@Getter
@Setter
public class AdminDeleteUserPermissionV3 extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v3/admin/namespaces/{namespace}/users/{userId}/permissions/{resource}/{action}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private Integer action;

  private String namespace;
  private String resource;
  private String userId;

  /**
   * @param action required
   * @param namespace required
   * @param resource required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminDeleteUserPermissionV3(
      Integer action, String namespace, String resource, String userId) {
    this.action = action;
    this.namespace = namespace;
    this.resource = resource;
    this.userId = userId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.action != null) {
      pathParams.put("action", this.action == null ? null : String.valueOf(this.action));
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.resource != null) {
      pathParams.put("resource", this.resource);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.action == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.resource == null) {
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

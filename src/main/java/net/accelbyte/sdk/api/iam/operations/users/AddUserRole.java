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
 * AddUserRole
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/admin/namespaces/{namespace}/users/{userId}/roles/{roleId}
 * [POST]
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:ROLE:USER:{userId} [UPDATE]'
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class AddUserRole extends Operation {
  /** generated field's value */
  private String path = "/iam/namespaces/{namespace}/users/{userId}/roles/{roleId}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json", "text/plain");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String roleId;
  private String userId;

  /**
   * @param namespace required
   * @param roleId required
   * @param userId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AddUserRole(String namespace, String roleId, String userId) {
    this.namespace = namespace;
    this.roleId = roleId;
    this.userId = userId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.roleId != null) {
      pathParams.put("roleId", this.roleId);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.roleId == null) {
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

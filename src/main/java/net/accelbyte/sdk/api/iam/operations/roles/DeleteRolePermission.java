/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.roles;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * DeleteRolePermission
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Required permission 'ROLE:ADMIN [UPDATE]' or 'ADMIN:ROLE [UPDATE]' Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/admin/roles/{roleId}/permissions/{resource}/{action} [DELETE]
 *
 * <p>* Substitute endpoint: /iam/v4/admin/roles/{roleId}/permissions [DELETE]
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class DeleteRolePermission extends Operation {
  /** generated field's value */
  private String path = "/iam/roles/{roleId}/permissions/{resource}/{action}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private Integer action;

  private String resource;
  private String roleId;

  /**
   * @param action required
   * @param resource required
   * @param roleId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteRolePermission(Integer action, String resource, String roleId) {
    this.action = action;
    this.resource = resource;
    this.roleId = roleId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.action != null) {
      pathParams.put("action", this.action == null ? null : String.valueOf(this.action));
    }
    if (this.resource != null) {
      pathParams.put("resource", this.resource);
    }
    if (this.roleId != null) {
      pathParams.put("roleId", this.roleId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.action == null) {
      return false;
    }
    if (this.resource == null) {
      return false;
    }
    if (this.roleId == null) {
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

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
 * AdminUpdateAdminRoleStatusV3
 *
 * <p>Required permission 'ADMIN:ROLE [UPDATE]'
 *
 * <p>Admin roles has its members listed in the role.
 *
 * <p>Role can be set as admin role only when it has at least 1 manager.
 *
 * <p>action code: 10412
 */
@Getter
@Setter
public class AdminUpdateAdminRoleStatusV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/roles/{roleId}/admin";

  private String method = "POST";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String roleId;

  /**
   * @param roleId required
   */
  @Builder
  public AdminUpdateAdminRoleStatusV3(String roleId) {
    this.roleId = roleId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.roleId != null) {
      pathParams.put("roleId", this.roleId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.roleId == null) {
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

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
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminRemoveRoleMembersV3
 *
 * <p>Required permission 'ADMIN:ROLE [UPDATE]'
 *
 * <p>Admin roles has its members listed in the role.
 *
 * <p>Role can only be assigned to other users by the role's manager.
 *
 * <p>action code: 10411
 */
@Getter
@Setter
public class AdminRemoveRoleMembersV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/roles/{roleId}/members";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String roleId;

  private ModelRoleMembersRequestV3 body;

  /**
   * @param roleId required
   * @param body required
   */
  @Builder
  public AdminRemoveRoleMembersV3(String roleId, ModelRoleMembersRequestV3 body) {
    this.roleId = roleId;
    this.body = body;

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
  public ModelRoleMembersRequestV3 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.roleId == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

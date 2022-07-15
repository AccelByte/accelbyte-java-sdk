/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.roles;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelRevokeUserV4Request;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminRevokeUserFromRoleV4
 *
 * <p>Required permission ADMIN:ROLE [UPDATE]
 *
 * <p>Current implementation will revoke user from role in all assigned namespaces.
 *
 * <p>Parameters: - userId: string (required) - namespace: string (userâs namespace) (required)
 *
 * <p>action code: 10411
 */
@Getter
@Setter
public class AdminRevokeUserFromRoleV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/admin/roles/{roleId}/users";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String roleId;

  private ModelRevokeUserV4Request body;

  /**
   * @param roleId required
   * @param body required
   */
  @Builder
  public AdminRevokeUserFromRoleV4(String roleId, ModelRevokeUserV4Request body) {
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
  public ModelRevokeUserV4Request getBodyParams() {
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

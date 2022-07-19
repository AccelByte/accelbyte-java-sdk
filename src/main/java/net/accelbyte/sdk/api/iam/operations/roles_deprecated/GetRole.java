/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.roles_deprecated;

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
 * GetRole
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Required permission 'ROLE [READ]' Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/admin/roles/{roleId} [GET]
 *
 * <p>* Note:
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class GetRole extends Operation {
  /** generated field's value */
  private String path = "/iam/roles/{roleId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String roleId;

  /**
   * @param roleId required
   */
  @Builder
  public GetRole(String roleId) {
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

  public ModelRoleResponse parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelRoleResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}

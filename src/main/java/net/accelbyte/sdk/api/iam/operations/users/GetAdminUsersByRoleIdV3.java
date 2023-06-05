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
 * GetAdminUsersByRoleIdV3
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:USER [READ]'
 *
 * <p>This endpoint search admin users which have the roleId
 *
 * <p>Notes : this endpoint only accept admin role. Admin Role is role which have admin status and
 * members. Use endpoint [GET] /roles/{roleId}/admin to check the role status
 *
 * <p>action code : 10140
 */
@Getter
@Setter
public class GetAdminUsersByRoleIdV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/roles/{roleId}/users";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String roleId;
  private Integer after;
  private Integer before;
  private Integer limit;

  /**
   * @param namespace required
   * @param roleId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetAdminUsersByRoleIdV3(
      String namespace, String roleId, Integer after, Integer before, Integer limit) {
    this.namespace = namespace;
    this.roleId = roleId;
    this.after = after;
    this.before = before;
    this.limit = limit;

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
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("after", this.after == null ? null : Arrays.asList(String.valueOf(this.after)));
    queryParams.put(
        "before", this.before == null ? null : Arrays.asList(String.valueOf(this.before)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.roleId == null) {
      return false;
    }
    return true;
  }

  public ModelGetUsersResponseWithPaginationV3 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelGetUsersResponseWithPaginationV3().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("after", "None");
    result.put("before", "None");
    result.put("limit", "None");
    return result;
  }
}

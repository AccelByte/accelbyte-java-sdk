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
 * ListAdminsV3
 *
 * <p>List all users that has admin role (role that has admin_role attribute set to true). Endpoint
 * behavior : - if query parameter is defined, endpoint will search users whose email address and
 * display name match with the query - if roleId parameter is defined, endpoint will search users
 * that have the defined roleId - if startDate and endDate parameters is defined, endpoint will
 * search users which created on the certain date range - if startDate parameter is defined,
 * endpoint will search users that created start from the defined date - if endDate parameter is
 * defined, endpoint will search users that created until the defined date
 *
 * <p>In multi tenant mode : - if super admin search in super admin namespace, the result will be
 * all admin users - if super admin search in game studio namespace, the result will be all admin
 * users under the game studio namespace - if studio admin search in their studio namespace, the
 * result will be all admin user in the game studio namespace
 *
 * <p>The endpoint will return all admin from all namespace when called from publisher namespace.
 * When not called from publisher namespace, the endpoint will return all admin from the path
 * namespace.
 */
@Getter
@Setter
public class ListAdminsV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/admins";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String after;
  private String before;
  private String endDate;
  private Integer limit;
  private String query;
  private String roleId;
  private String startDate;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ListAdminsV3(
      String namespace,
      String after,
      String before,
      String endDate,
      Integer limit,
      String query,
      String roleId,
      String startDate) {
    this.namespace = namespace;
    this.after = after;
    this.before = before;
    this.endDate = endDate;
    this.limit = limit;
    this.query = query;
    this.roleId = roleId;
    this.startDate = startDate;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("after", this.after == null ? null : Arrays.asList(this.after));
    queryParams.put("before", this.before == null ? null : Arrays.asList(this.before));
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("query", this.query == null ? null : Arrays.asList(this.query));
    queryParams.put("roleId", this.roleId == null ? null : Arrays.asList(this.roleId));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
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
    result.put("endDate", "None");
    result.put("limit", "None");
    result.put("query", "None");
    result.put("roleId", "None");
    result.put("startDate", "None");
    return result;
  }
}

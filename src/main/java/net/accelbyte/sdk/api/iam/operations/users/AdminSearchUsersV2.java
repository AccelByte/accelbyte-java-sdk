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
 * AdminSearchUsersV2
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/admin/namespaces/{namespace}/users/search [GET]
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:USER [READ]'.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class AdminSearchUsersV2 extends Operation {
  /** generated field's value */
  private String path = "/iam/v2/admin/namespaces/{namespace}/users";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String after;
  private String before;
  private String displayName;
  private Integer limit;
  private String loginId;
  private String platformUserId;
  private String roleId;
  private String userId;
  private String platformId;

  /**
   * @param namespace required
   * @param platformId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminSearchUsersV2(
      String namespace,
      String after,
      String before,
      String displayName,
      Integer limit,
      String loginId,
      String platformUserId,
      String roleId,
      String userId,
      String platformId) {
    this.namespace = namespace;
    this.after = after;
    this.before = before;
    this.displayName = displayName;
    this.limit = limit;
    this.loginId = loginId;
    this.platformUserId = platformUserId;
    this.roleId = roleId;
    this.userId = userId;
    this.platformId = platformId;

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
    queryParams.put(
        "displayName", this.displayName == null ? null : Arrays.asList(this.displayName));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("loginId", this.loginId == null ? null : Arrays.asList(this.loginId));
    queryParams.put(
        "platformUserId", this.platformUserId == null ? null : Arrays.asList(this.platformUserId));
    queryParams.put("roleId", this.roleId == null ? null : Arrays.asList(this.roleId));
    queryParams.put("userId", this.userId == null ? null : Arrays.asList(this.userId));
    queryParams.put("platformId", this.platformId == null ? null : Arrays.asList(this.platformId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platformId == null) {
      return false;
    }
    return true;
  }

  public ModelSearchUsersByPlatformIDResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelSearchUsersByPlatformIDResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("after", "None");
    result.put("before", "None");
    result.put("displayName", "None");
    result.put("limit", "None");
    result.put("loginId", "None");
    result.put("platformUserId", "None");
    result.put("roleId", "None");
    result.put("userId", "None");
    result.put("platformId", "None");
    return result;
  }
}

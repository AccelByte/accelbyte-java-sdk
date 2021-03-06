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
 * SearchUser
 *
 * <p>## The endpoint is deprecated. Please use this instead:
 * iam/v3/admin/namespaces/{namespace}/users/search
 *
 * <p>Search all users that match the query on these fields: all login IDs (email address, phone
 * number, and platform user id), userID, display name, and on the specified namespace. If the query
 * is not defined, then it searches all users on the specified namespace. Required permission
 * 'ADMIN:NAMESPACE:{namespace}:USER:* [READ]'
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class SearchUser extends Operation {
  /** generated field's value */
  private String path = "/iam/namespaces/{namespace}/users/search";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String query;

  /**
   * @param namespace required
   */
  @Builder
  public SearchUser(String namespace, String query) {
    this.namespace = namespace;
    this.query = query;

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
    queryParams.put("query", this.query == null ? null : Arrays.asList(this.query));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelSearchUsersResponse parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelSearchUsersResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("query", "None");
    return result;
  }
}

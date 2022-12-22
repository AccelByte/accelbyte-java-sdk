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
 * PublicGetUserLoginHistoriesV3
 *
 * <p>Required valid user authorization.
 *
 * <p>Notes for this endpoint:
 *
 * <p>* This endpoint retrieve the first page of the data if `after` and `before` parameters is
 * empty. * The maximum value of the limit is 100 and the minimum value of the limit is 1. * This
 * endpoint retrieve the next page of the data if we provide `after` parameters with valid Unix
 * timestamp. * This endpoint retrieve the previous page of the data if we provide `before`
 * parameter with valid data Unix timestamp.
 */
@Getter
@Setter
public class PublicGetUserLoginHistoriesV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/namespaces/{namespace}/users/{userId}/logins/histories";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private Float after;
  private Float before;
  private Integer limit;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetUserLoginHistoriesV3(
      String namespace, String userId, Float after, Float before, Integer limit) {
    this.namespace = namespace;
    this.userId = userId;
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
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
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
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public ModelLoginHistoriesResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelLoginHistoriesResponse().createFromJson(json);
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

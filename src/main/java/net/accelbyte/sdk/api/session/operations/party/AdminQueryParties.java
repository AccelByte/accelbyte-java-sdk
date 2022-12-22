/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.party;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminQueryParties
 *
 * <p>Query parties.
 */
@Getter
@Setter
public class AdminQueryParties extends Operation {
  /** generated field's value */
  private String path = "/session/v1/admin/namespaces/{namespace}/parties";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String joinability;
  private String key;
  private String leaderID;
  private Integer limit;
  private String memberID;
  private String memberStatus;
  private Integer offset;
  private String order;
  private String orderBy;
  private String value;

  /**
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminQueryParties(
      String namespace,
      String joinability,
      String key,
      String leaderID,
      Integer limit,
      String memberID,
      String memberStatus,
      Integer offset,
      String order,
      String orderBy,
      String value) {
    this.namespace = namespace;
    this.joinability = joinability;
    this.key = key;
    this.leaderID = leaderID;
    this.limit = limit;
    this.memberID = memberID;
    this.memberStatus = memberStatus;
    this.offset = offset;
    this.order = order;
    this.orderBy = orderBy;
    this.value = value;

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
    queryParams.put(
        "joinability", this.joinability == null ? null : Arrays.asList(this.joinability));
    queryParams.put("key", this.key == null ? null : Arrays.asList(this.key));
    queryParams.put("leaderID", this.leaderID == null ? null : Arrays.asList(this.leaderID));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("memberID", this.memberID == null ? null : Arrays.asList(this.memberID));
    queryParams.put(
        "memberStatus", this.memberStatus == null ? null : Arrays.asList(this.memberStatus));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put("orderBy", this.orderBy == null ? null : Arrays.asList(this.orderBy));
    queryParams.put("value", this.value == null ? null : Arrays.asList(this.value));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelsPartyQueryResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsPartyQueryResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("joinability", "None");
    result.put("key", "None");
    result.put("leaderID", "None");
    result.put("limit", "None");
    result.put("memberID", "None");
    result.put("memberStatus", "None");
    result.put("offset", "None");
    result.put("order", "None");
    result.put("orderBy", "None");
    result.put("value", "None");
    return result;
  }
}

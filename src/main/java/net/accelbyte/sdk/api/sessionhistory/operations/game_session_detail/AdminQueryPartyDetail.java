/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.sessionhistory.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminQueryPartyDetail
 *
 * <p>Get all parties.
 */
@Getter
@Setter
public class AdminQueryPartyDetail extends Operation {
  /** generated field's value */
  private String path = "/sessionhistory/v1/admin/namespaces/{namespace}/parties";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String endDate;
  private String joinability;
  private String leaderID;
  private Integer limit;
  private Integer offset;
  private String order;
  private String orderBy;
  private String partyID;
  private String startDate;
  private String userID;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminQueryPartyDetail(
      String namespace,
      String endDate,
      String joinability,
      String leaderID,
      Integer limit,
      Integer offset,
      String order,
      String orderBy,
      String partyID,
      String startDate,
      String userID) {
    this.namespace = namespace;
    this.endDate = endDate;
    this.joinability = joinability;
    this.leaderID = leaderID;
    this.limit = limit;
    this.offset = offset;
    this.order = order;
    this.orderBy = orderBy;
    this.partyID = partyID;
    this.startDate = startDate;
    this.userID = userID;

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
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put(
        "joinability", this.joinability == null ? null : Arrays.asList(this.joinability));
    queryParams.put("leaderID", this.leaderID == null ? null : Arrays.asList(this.leaderID));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put("orderBy", this.orderBy == null ? null : Arrays.asList(this.orderBy));
    queryParams.put("partyID", this.partyID == null ? null : Arrays.asList(this.partyID));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    queryParams.put("userID", this.userID == null ? null : Arrays.asList(this.userID));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelsPartyDetailQueryResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsPartyDetailQueryResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endDate", "None");
    result.put("joinability", "None");
    result.put("leaderID", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("order", "None");
    result.put("orderBy", "None");
    result.put("partyID", "None");
    result.put("startDate", "None");
    result.put("userID", "None");
    return result;
  }
}

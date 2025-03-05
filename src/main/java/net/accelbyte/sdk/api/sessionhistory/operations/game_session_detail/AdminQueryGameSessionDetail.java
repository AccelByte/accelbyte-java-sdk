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
 * adminQueryGameSessionDetail
 *
 * <p>Get all game sessions.
 */
@Getter
@Setter
public class AdminQueryGameSessionDetail extends Operation {
  /** generated field's value */
  private String path = "/sessionhistory/v1/admin/namespaces/{namespace}/gamesessions";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String completedOnly;
  private String configurationName;
  private String dsPodName;
  private String endDate;
  private String gameSessionID;
  private String isPersistent;
  private String joinability;
  private Integer limit;
  private String matchPool;
  private Integer offset;
  private String order;
  private String orderBy;
  private String startDate;
  private String statusV2;
  private String userID;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminQueryGameSessionDetail(
      String namespace,
      String completedOnly,
      String configurationName,
      String dsPodName,
      String endDate,
      String gameSessionID,
      String isPersistent,
      String joinability,
      Integer limit,
      String matchPool,
      Integer offset,
      String order,
      String orderBy,
      String startDate,
      String statusV2,
      String userID) {
    this.namespace = namespace;
    this.completedOnly = completedOnly;
    this.configurationName = configurationName;
    this.dsPodName = dsPodName;
    this.endDate = endDate;
    this.gameSessionID = gameSessionID;
    this.isPersistent = isPersistent;
    this.joinability = joinability;
    this.limit = limit;
    this.matchPool = matchPool;
    this.offset = offset;
    this.order = order;
    this.orderBy = orderBy;
    this.startDate = startDate;
    this.statusV2 = statusV2;
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
    queryParams.put(
        "completedOnly", this.completedOnly == null ? null : Arrays.asList(this.completedOnly));
    queryParams.put(
        "configurationName",
        this.configurationName == null ? null : Arrays.asList(this.configurationName));
    queryParams.put("dsPodName", this.dsPodName == null ? null : Arrays.asList(this.dsPodName));
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put(
        "gameSessionID", this.gameSessionID == null ? null : Arrays.asList(this.gameSessionID));
    queryParams.put(
        "isPersistent", this.isPersistent == null ? null : Arrays.asList(this.isPersistent));
    queryParams.put(
        "joinability", this.joinability == null ? null : Arrays.asList(this.joinability));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("matchPool", this.matchPool == null ? null : Arrays.asList(this.matchPool));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put("orderBy", this.orderBy == null ? null : Arrays.asList(this.orderBy));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    queryParams.put("statusV2", this.statusV2 == null ? null : Arrays.asList(this.statusV2));
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

  public ApimodelsGameSessionDetailQueryResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsGameSessionDetailQueryResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("completedOnly", "None");
    result.put("configurationName", "None");
    result.put("dsPodName", "None");
    result.put("endDate", "None");
    result.put("gameSessionID", "None");
    result.put("isPersistent", "None");
    result.put("joinability", "None");
    result.put("limit", "None");
    result.put("matchPool", "None");
    result.put("offset", "None");
    result.put("order", "None");
    result.put("orderBy", "None");
    result.put("startDate", "None");
    result.put("statusV2", "None");
    result.put("userID", "None");
    return result;
  }
}

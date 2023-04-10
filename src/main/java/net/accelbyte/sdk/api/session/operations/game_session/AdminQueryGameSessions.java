/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.game_session;

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
 * adminQueryGameSessions
 *
 * <p>Get all game sessions. Requires ADMIN:NAMESPACE:{namespace}:SESSION:GAME [READ]
 */
@Getter
@Setter
public class AdminQueryGameSessions extends Operation {
  /** generated field's value */
  private String path = "/session/v1/admin/namespaces/{namespace}/gamesessions";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String configurationName;
  private String dsPodName;
  private String fromTime;
  private String gameMode;
  private String isPersistent;
  private String isSoftDeleted;
  private String joinability;
  private Integer limit;
  private String matchPool;
  private String memberID;
  private Integer offset;
  private String order;
  private String orderBy;
  private String sessionID;
  private String status;
  private String statusV2;
  private String toTime;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminQueryGameSessions(
      String namespace,
      String configurationName,
      String dsPodName,
      String fromTime,
      String gameMode,
      String isPersistent,
      String isSoftDeleted,
      String joinability,
      Integer limit,
      String matchPool,
      String memberID,
      Integer offset,
      String order,
      String orderBy,
      String sessionID,
      String status,
      String statusV2,
      String toTime) {
    this.namespace = namespace;
    this.configurationName = configurationName;
    this.dsPodName = dsPodName;
    this.fromTime = fromTime;
    this.gameMode = gameMode;
    this.isPersistent = isPersistent;
    this.isSoftDeleted = isSoftDeleted;
    this.joinability = joinability;
    this.limit = limit;
    this.matchPool = matchPool;
    this.memberID = memberID;
    this.offset = offset;
    this.order = order;
    this.orderBy = orderBy;
    this.sessionID = sessionID;
    this.status = status;
    this.statusV2 = statusV2;
    this.toTime = toTime;

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
        "configurationName",
        this.configurationName == null ? null : Arrays.asList(this.configurationName));
    queryParams.put("dsPodName", this.dsPodName == null ? null : Arrays.asList(this.dsPodName));
    queryParams.put("fromTime", this.fromTime == null ? null : Arrays.asList(this.fromTime));
    queryParams.put("gameMode", this.gameMode == null ? null : Arrays.asList(this.gameMode));
    queryParams.put(
        "isPersistent", this.isPersistent == null ? null : Arrays.asList(this.isPersistent));
    queryParams.put(
        "isSoftDeleted", this.isSoftDeleted == null ? null : Arrays.asList(this.isSoftDeleted));
    queryParams.put(
        "joinability", this.joinability == null ? null : Arrays.asList(this.joinability));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("matchPool", this.matchPool == null ? null : Arrays.asList(this.matchPool));
    queryParams.put("memberID", this.memberID == null ? null : Arrays.asList(this.memberID));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put("orderBy", this.orderBy == null ? null : Arrays.asList(this.orderBy));
    queryParams.put("sessionID", this.sessionID == null ? null : Arrays.asList(this.sessionID));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    queryParams.put("statusV2", this.statusV2 == null ? null : Arrays.asList(this.statusV2));
    queryParams.put("toTime", this.toTime == null ? null : Arrays.asList(this.toTime));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelsGameSessionQueryResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsGameSessionQueryResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("configurationName", "None");
    result.put("dsPodName", "None");
    result.put("fromTime", "None");
    result.put("gameMode", "None");
    result.put("isPersistent", "None");
    result.put("isSoftDeleted", "None");
    result.put("joinability", "None");
    result.put("limit", "None");
    result.put("matchPool", "None");
    result.put("memberID", "None");
    result.put("offset", "None");
    result.put("order", "None");
    result.put("orderBy", "None");
    result.put("sessionID", "None");
    result.put("status", "None");
    result.put("statusV2", "None");
    result.put("toTime", "None");
    return result;
  }
}

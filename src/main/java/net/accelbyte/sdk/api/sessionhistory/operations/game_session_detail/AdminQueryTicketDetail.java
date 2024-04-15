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
 * adminQueryTicketDetail
 *
 * <p>Get all matchmaking ticket.
 */
@Getter
@Setter
public class AdminQueryTicketDetail extends Operation {
  /** generated field's value */
  private String path = "/sessionhistory/v1/admin/namespaces/{namespace}/tickets";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String endDate;
  private String gameMode;
  private Integer limit;
  private Integer offset;
  private String order;
  private String partyID;
  private String region;
  private String startDate;
  private String userIDs;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminQueryTicketDetail(
      String namespace,
      String endDate,
      String gameMode,
      Integer limit,
      Integer offset,
      String order,
      String partyID,
      String region,
      String startDate,
      String userIDs) {
    this.namespace = namespace;
    this.endDate = endDate;
    this.gameMode = gameMode;
    this.limit = limit;
    this.offset = offset;
    this.order = order;
    this.partyID = partyID;
    this.region = region;
    this.startDate = startDate;
    this.userIDs = userIDs;

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
    queryParams.put("gameMode", this.gameMode == null ? null : Arrays.asList(this.gameMode));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put("partyID", this.partyID == null ? null : Arrays.asList(this.partyID));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    queryParams.put("userIDs", this.userIDs == null ? null : Arrays.asList(this.userIDs));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelsTicketDetailQueryResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsTicketDetailQueryResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endDate", "None");
    result.put("gameMode", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("order", "None");
    result.put("partyID", "None");
    result.put("region", "None");
    result.put("startDate", "None");
    result.put("userIDs", "None");
    return result;
  }
}

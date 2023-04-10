/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.operations.matchmaking;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * SearchSessionsV2
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint: /sessionbrowser/admin/namespaces/{namespace}/sessions/history/search
 * [GET]
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [Read]
 *
 * <p>Required Scope: social
 *
 * <p>Search sessions. Optimize the query by differentiating query with filter namespace only and
 * filter with namespace & other filter (partyID, userID, matchID). Query with filter namespace only
 * will not group whole session data while query with filter namespace & other filter will include
 * session data.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class SearchSessionsV2 extends Operation {
  /** generated field's value */
  private String path = "/matchmaking/v2/admin/namespaces/{namespace}/sessions/history/search";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String channel;
  private Boolean deleted;
  private String matchID;
  private String partyID;
  private String userID;
  private Integer limit;
  private Integer offset;

  /**
   * @param namespace required
   * @param limit required
   * @param offset required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SearchSessionsV2(
      String namespace,
      String channel,
      Boolean deleted,
      String matchID,
      String partyID,
      String userID,
      Integer limit,
      Integer offset) {
    this.namespace = namespace;
    this.channel = channel;
    this.deleted = deleted;
    this.matchID = matchID;
    this.partyID = partyID;
    this.userID = userID;
    this.limit = limit;
    this.offset = offset;

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
    queryParams.put("channel", this.channel == null ? null : Arrays.asList(this.channel));
    queryParams.put(
        "deleted", this.deleted == null ? null : Arrays.asList(String.valueOf(this.deleted)));
    queryParams.put("matchID", this.matchID == null ? null : Arrays.asList(this.matchID));
    queryParams.put("partyID", this.partyID == null ? null : Arrays.asList(this.partyID));
    queryParams.put("userID", this.userID == null ? null : Arrays.asList(this.userID));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.limit == null) {
      return false;
    }
    if (this.offset == null) {
      return false;
    }
    return true;
  }

  public ServiceGetSessionHistorySearchResponseV2 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ServiceGetSessionHistorySearchResponseV2().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("channel", "None");
    result.put("deleted", "None");
    result.put("matchID", "None");
    result.put("partyID", "None");
    result.put("userID", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    return result;
  }
}

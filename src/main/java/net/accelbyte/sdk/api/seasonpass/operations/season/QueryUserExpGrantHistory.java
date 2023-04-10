/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.operations.season;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * queryUserExpGrantHistory
 *
 * <p>This API is used to get user exp acquisition history, season only located in non-publisher
 * namespace.
 *
 * <p>Other detail info:
 *
 * <p>* default will query from current active season * Required permission :
 * resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:SEASONPASS", action=2 (READ) * Returns :
 * paginated grant history
 */
@Getter
@Setter
public class QueryUserExpGrantHistory extends Operation {
  /** generated field's value */
  private String path =
      "/seasonpass/admin/namespaces/{namespace}/users/{userId}/seasons/exp/history";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String from;
  private Integer limit;
  private Integer offset;
  private String seasonId;
  private String source;
  private List<String> tags;
  private String to;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryUserExpGrantHistory(
      String namespace,
      String userId,
      String from,
      Integer limit,
      Integer offset,
      String seasonId,
      String source,
      List<String> tags,
      String to) {
    this.namespace = namespace;
    this.userId = userId;
    this.from = from;
    this.limit = limit;
    this.offset = offset;
    this.seasonId = seasonId;
    this.source = source;
    this.tags = tags;
    this.to = to;

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
    queryParams.put("from", this.from == null ? null : Arrays.asList(this.from));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("seasonId", this.seasonId == null ? null : Arrays.asList(this.seasonId));
    queryParams.put("source", this.source == null ? null : Arrays.asList(this.source));
    queryParams.put("tags", this.tags == null ? null : this.tags);
    queryParams.put("to", this.to == null ? null : Arrays.asList(this.to));
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

  public ExpGrantHistoryPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ExpGrantHistoryPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("from", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("seasonId", "None");
    result.put("source", "None");
    result.put("tags", "multi");
    result.put("to", "None");
    return result;
  }

  public enum Source {
    PAIDFOR("PAID_FOR"),
    SWEAT("SWEAT");

    private String value;

    Source(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryUserExpGrantHistoryBuilder {
    private String source;

    public QueryUserExpGrantHistoryBuilder source(final String source) {
      this.source = source;
      return this;
    }

    public QueryUserExpGrantHistoryBuilder sourceFromEnum(final Source source) {
      this.source = source.toString();
      return this;
    }
  }
}

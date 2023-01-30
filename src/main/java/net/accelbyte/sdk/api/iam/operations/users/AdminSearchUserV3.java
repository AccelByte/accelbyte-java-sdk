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
 * AdminSearchUserV3
 *
 * <p>Required permission ADMIN:NAMESPACE:{namespace}:USER [READ]
 *
 * <p>Endpoint behavior :
 *
 * <p>* by default this endpoint searches all users on the specified namespace
 *
 * <p>* if query parameter is defined, endpoint will search users whose email address, display name,
 * username, or third party partially match with the query
 *
 * <p>* if startDate and endDate parameters is defined, endpoint will search users which created on
 * the certain date range
 *
 * <p>* if query, startDate and endDate parameters are defined, endpoint will search users whose
 * email address and display name match and created on the certain date range
 *
 * <p>* if startDate parameter is defined, endpoint will search users that created start from the
 * defined date
 *
 * <p>* if endDate parameter is defined, endpoint will search users that created until the defined
 * date
 *
 * <p>* if platformId parameter is defined and by parameter is using thirdparty, endpoint will
 * search users based on the platformId they have linked to
 *
 * <p>* if platformBy parameter is defined and by parameter is using thirdparty, endpoint will
 * search users based on the platformUserId or platformDisplayName they have linked to, example
 * value: platformUserId or platformDisplayName
 *
 * <p>* if limit is not defined, The default limit is 100
 *
 * <p>In multi tenant mode :
 *
 * <p>* if super admin search in super admin namespace, the result will be all game admin user
 *
 * <p>* if super admin search in game studio namespace, the result will be all game admin user and
 * players under the game studio namespace
 *
 * <p>* if super admin search in game namespace, the result will be all game admin users and players
 * under the game namespace
 *
 * <p>* if game admin search in their game studio namespace, the result will be all game admin user
 * in the studio namespace
 *
 * <p>* if game admin search in their game namespace, the result will be all player in the game
 * namespace
 *
 * <p>action code : 10133
 */
@Getter
@Setter
public class AdminSearchUserV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/users/search";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String by;
  private String endDate;
  private Integer limit;
  private Integer offset;
  private String platformBy;
  private String platformId;
  private String query;
  private String startDate;

  /**
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminSearchUserV3(
      String namespace,
      String by,
      String endDate,
      Integer limit,
      Integer offset,
      String platformBy,
      String platformId,
      String query,
      String startDate) {
    this.namespace = namespace;
    this.by = by;
    this.endDate = endDate;
    this.limit = limit;
    this.offset = offset;
    this.platformBy = platformBy;
    this.platformId = platformId;
    this.query = query;
    this.startDate = startDate;

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
    queryParams.put("by", this.by == null ? null : Arrays.asList(this.by));
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("platformBy", this.platformBy == null ? null : Arrays.asList(this.platformBy));
    queryParams.put("platformId", this.platformId == null ? null : Arrays.asList(this.platformId));
    queryParams.put("query", this.query == null ? null : Arrays.asList(this.query));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelSearchUsersResponseWithPaginationV3 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelSearchUsersResponseWithPaginationV3().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("by", "None");
    result.put("endDate", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("platformBy", "None");
    result.put("platformId", "None");
    result.put("query", "None");
    result.put("startDate", "None");
    return result;
  }
}

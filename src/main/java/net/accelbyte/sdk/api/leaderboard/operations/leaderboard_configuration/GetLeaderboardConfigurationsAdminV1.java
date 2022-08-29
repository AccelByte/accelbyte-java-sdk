/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getLeaderboardConfigurationsAdminV1
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:LEADERBOARD [READ]'
 *
 * <p>This endpoint return all leaderboard configurations
 */
@Getter
@Setter
public class GetLeaderboardConfigurationsAdminV1 extends Operation {
  /** generated field's value */
  private String path = "/leaderboard/v1/admin/namespaces/{namespace}/leaderboards";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private Boolean isArchived;
  private Boolean isDeleted;
  private Integer limit;
  private Integer offset;

  /**
   * @param namespace required
   */
  @Builder
  /*
   *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
   */
  @Deprecated
  public GetLeaderboardConfigurationsAdminV1(
      String namespace, Boolean isArchived, Boolean isDeleted, Integer limit, Integer offset) {
    this.namespace = namespace;
    this.isArchived = isArchived;
    this.isDeleted = isDeleted;
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
    queryParams.put(
        "isArchived",
        this.isArchived == null ? null : Arrays.asList(String.valueOf(this.isArchived)));
    queryParams.put(
        "isDeleted", this.isDeleted == null ? null : Arrays.asList(String.valueOf(this.isDeleted)));
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
    return true;
  }

  public ModelsGetAllLeaderboardConfigsResp parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsGetAllLeaderboardConfigsResp().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("isArchived", "None");
    result.put("isDeleted", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    return result;
  }
}

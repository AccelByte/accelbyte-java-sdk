/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data_v3;

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
 * GetCurrentCycleLeaderboardRankingAdminV3
 *
 * <p>Get rankings in cycle leaderboard.
 */
@Getter
@Setter
public class GetCurrentCycleLeaderboardRankingAdminV3 extends Operation {
  /** generated field's value */
  private String path =
      "/leaderboard/v3/admin/namespaces/{namespace}/leaderboards/{leaderboardCode}/cycles/{cycleId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String cycleId;

  private String leaderboardCode;
  private String namespace;
  private Integer limit;
  private Integer offset;
  private Integer previousVersion;

  /**
   * @param cycleId required
   * @param leaderboardCode required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetCurrentCycleLeaderboardRankingAdminV3(
      String cycleId,
      String leaderboardCode,
      String namespace,
      Integer limit,
      Integer offset,
      Integer previousVersion) {
    this.cycleId = cycleId;
    this.leaderboardCode = leaderboardCode;
    this.namespace = namespace;
    this.limit = limit;
    this.offset = offset;
    this.previousVersion = previousVersion;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.cycleId != null) {
      pathParams.put("cycleId", this.cycleId);
    }
    if (this.leaderboardCode != null) {
      pathParams.put("leaderboardCode", this.leaderboardCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put(
        "previousVersion",
        this.previousVersion == null ? null : Arrays.asList(String.valueOf(this.previousVersion)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.cycleId == null) {
      return false;
    }
    if (this.leaderboardCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsGetLeaderboardRankingResp parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsGetLeaderboardRankingResp().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("previousVersion", "None");
    return result;
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * AdminGetArchivedLeaderboardRankingDataV1Handler
 *
 * <p>Admin Get signed url in an all time leaderboard that archived. Notes: This will be a bulk
 * endpoint to get sign url
 */
@Getter
@Setter
public class AdminGetArchivedLeaderboardRankingDataV1Handler extends Operation {
  /** generated field's value */
  private String path = "/leaderboard/v1/admin/namespaces/{namespace}/leaderboards/archived";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String slug;
  private String leaderboardCodes;

  /**
   * @param namespace required
   * @param leaderboardCodes required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGetArchivedLeaderboardRankingDataV1Handler(
      String namespace, String slug, String leaderboardCodes) {
    this.namespace = namespace;
    this.slug = slug;
    this.leaderboardCodes = leaderboardCodes;

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
    queryParams.put("slug", this.slug == null ? null : Arrays.asList(this.slug));
    queryParams.put(
        "leaderboardCodes",
        this.leaderboardCodes == null ? null : Arrays.asList(this.leaderboardCodes));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.leaderboardCodes == null) {
      return false;
    }
    return true;
  }

  public List<ModelsArchiveLeaderboardSignedURLResponse> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsArchiveLeaderboardSignedURLResponse>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("slug", "None");
    result.put("leaderboardCodes", "None");
    return result;
  }
}

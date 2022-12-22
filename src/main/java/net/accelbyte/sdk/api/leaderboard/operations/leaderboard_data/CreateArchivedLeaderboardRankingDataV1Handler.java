/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data;

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
 * CreateArchivedLeaderboardRankingDataV1Handler
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:LEADERBOARD [CREATE]'
 *
 * <p>Archive leaderboard ranking data for specified leaderboard codes. NOTE: This will remove all
 * data of the leaderboard on every slug, remove the leaderboard code on stat mapping, and remove
 * the leaderboard on the queue reset. This will be a bulk endpoint
 */
@Getter
@Setter
public class CreateArchivedLeaderboardRankingDataV1Handler extends Operation {
  /** generated field's value */
  private String path = "/leaderboard/v1/admin/namespaces/{namespace}/leaderboards/archived";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private ModelsArchiveLeaderboardReq body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateArchivedLeaderboardRankingDataV1Handler(
      String namespace, ModelsArchiveLeaderboardReq body) {
    this.namespace = namespace;
    this.body = body;

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
  public ModelsArchiveLeaderboardReq getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

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
 * updateUserPointAdminV1
 *
 * <p>Update user point in a leaderboard. This endpoint uses for test utility only.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission: resource="ADMIN:NAMESPACE:{namespace}:USER:(userId):LEADERBOARD",
 * action=4 (UPDATE)
 *
 * <p>* Returns: user ranking
 */
@Getter
@Setter
public class UpdateUserPointAdminV1 extends Operation {
  /** generated field's value */
  private String path =
      "/leaderboard/v1/admin/namespaces/{namespace}/leaderboards/{leaderboardCode}/users/{userId}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String leaderboardCode;

  private String namespace;
  private String userId;
  private ModelsUpdateUserPointAdminV1Request body;

  /**
   * @param leaderboardCode required
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateUserPointAdminV1(
      String leaderboardCode,
      String namespace,
      String userId,
      ModelsUpdateUserPointAdminV1Request body) {
    this.leaderboardCode = leaderboardCode;
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.leaderboardCode != null) {
      pathParams.put("leaderboardCode", this.leaderboardCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public ModelsUpdateUserPointAdminV1Request getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.leaderboardCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public ModelsUpdateUserPointAdminV1Response parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsUpdateUserPointAdminV1Response().createFromJson(json);
  }
}

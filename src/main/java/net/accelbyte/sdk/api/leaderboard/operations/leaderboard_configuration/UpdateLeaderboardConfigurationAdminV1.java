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
 * updateLeaderboardConfigurationAdminV1
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:LEADERBOARD [UPDATE]'
 *
 * <p>Fields :
 *
 * <p>* Maximum length for leaderboard name is 128 characters.
 *
 * <p>* Start time must be follow RFC3339 standard. e.g. 2020-10-02T15:00:00.05Z
 *
 * <p>* Season period must be greater than 31 days.
 *
 * <p>* If seasonPeriod is filled, the LeaderboardConfig would have seasonal leaderboard.
 *
 * <p>* Reset Date must be a number 1 - 31. Default is '1'.
 *
 * <p>* Reset Day must be a number 0 - 6. 0 = Sunday, 1 = Monday, 2 = Tuesday, 3 = Wednesday, 4 =
 * Thursday, 5 = Friday, 6 = Saturday (day of week). Default is '0'.
 *
 * <p>* Reset time must be hours:minutes in 24 hours format e.g. 01:30, 10:30, 15:30, 23:15.
 */
@Getter
@Setter
public class UpdateLeaderboardConfigurationAdminV1 extends Operation {
  /** generated field's value */
  private String path =
      "/leaderboard/v1/admin/namespaces/{namespace}/leaderboards/{leaderboardCode}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String leaderboardCode;

  private String namespace;
  private ModelsUpdateLeaderboardConfigReq body;

  /**
   * @param leaderboardCode required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateLeaderboardConfigurationAdminV1(
      String leaderboardCode, String namespace, ModelsUpdateLeaderboardConfigReq body) {
    this.leaderboardCode = leaderboardCode;
    this.namespace = namespace;
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
    return pathParams;
  }

  @Override
  public ModelsUpdateLeaderboardConfigReq getBodyParams() {
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
    return true;
  }

  public ModelsGetLeaderboardConfigResp parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsGetLeaderboardConfigResp().createFromJson(json);
  }
}

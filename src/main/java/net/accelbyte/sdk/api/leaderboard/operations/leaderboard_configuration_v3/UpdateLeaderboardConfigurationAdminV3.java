/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration_v3;

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
 * updateLeaderboardConfigurationAdminV3
 *
 * <p>Fields :
 *
 * <p>* leaderboardCode: unique leaderboard config code must be lowercase and maximum length is 48
 * characters. (required).
 *
 * <p>* name: leaderboard name, maximum length for leaderboard name is 128 characters. (required).
 *
 * <p>* description: leaderboard description, maximum length for leaderboard description is 2048
 * characters. (optional).
 *
 * <p>* iconURL: leaderboard icon image url. (optional).
 *
 * <p>* allTime: if true, all time leaderboard will be created. (required).
 *
 * <p>* descending: leaderboard order. If true, the points will be sorted in descending order.
 * (required).
 *
 * <p>* statCode: Stat Code is related with statistic code in statistic service. (required).
 *
 * <p>* cycleIds: Statistic cycle ids that will be tracked in the leaderboard. (required).
 */
@Getter
@Setter
public class UpdateLeaderboardConfigurationAdminV3 extends Operation {
  /** generated field's value */
  private String path =
      "/leaderboard/v3/admin/namespaces/{namespace}/leaderboards/{leaderboardCode}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String leaderboardCode;

  private String namespace;
  private ModelsUpdateLeaderboardConfigReqV3 body;

  /**
   * @param leaderboardCode required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateLeaderboardConfigurationAdminV3(
      String leaderboardCode, String namespace, ModelsUpdateLeaderboardConfigReqV3 body) {
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
  public ModelsUpdateLeaderboardConfigReqV3 getBodyParams() {
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

  public ModelsGetLeaderboardConfigRespV3 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsGetLeaderboardConfigRespV3().createFromJson(json);
  }
}

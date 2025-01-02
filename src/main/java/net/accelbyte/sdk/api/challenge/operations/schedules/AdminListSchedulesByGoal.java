/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.operations.schedules;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminListSchedulesByGoal
 *
 * <p>* Required permission: ADMIN:NAMESPACE:{namespace}:CHALLENGE [READ]
 *
 * <p>List schedules of given goal in a challenge for specific user.
 */
@Getter
@Setter
public class AdminListSchedulesByGoal extends Operation {
  /** generated field's value */
  private String path =
      "/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/goals/{code}/schedules";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String challengeCode;

  private String code;
  private String namespace;
  private Integer limit;
  private Integer offset;
  private String userId;

  /**
   * @param challengeCode required
   * @param code required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminListSchedulesByGoal(
      String challengeCode,
      String code,
      String namespace,
      Integer limit,
      Integer offset,
      String userId) {
    this.challengeCode = challengeCode;
    this.code = code;
    this.namespace = namespace;
    this.limit = limit;
    this.offset = offset;
    this.userId = userId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.challengeCode != null) {
      pathParams.put("challengeCode", this.challengeCode);
    }
    if (this.code != null) {
      pathParams.put("code", this.code);
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
    queryParams.put("userId", this.userId == null ? null : Arrays.asList(this.userId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.challengeCode == null) {
      return false;
    }
    if (this.code == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelListScheduleByGoalResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelListScheduleByGoalResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("userId", "None");
    return result;
  }
}

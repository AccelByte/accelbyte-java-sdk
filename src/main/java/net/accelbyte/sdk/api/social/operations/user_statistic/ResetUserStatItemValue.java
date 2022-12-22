/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * resetUserStatItemValue
 *
 * <p>Reset user's statitem value for a given namespace and user. User's statitem value will be
 * reset to the default value defined in the statistic configuration.
 *
 * <p>Other detail info: + *Required permission*:
 * resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:STATITEM", action=4 (UPDATE) + *Returns*:
 * updated user's statItem
 */
@Getter
@Setter
public class ResetUserStatItemValue extends Operation {
  /** generated field's value */
  private String path =
      "/social/v1/admin/namespaces/{namespace}/users/{userId}/stats/{statCode}/statitems/value/reset";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String statCode;
  private String userId;
  private String additionalKey;
  private StatResetInfo body;

  /**
   * @param namespace required
   * @param statCode required
   * @param userId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ResetUserStatItemValue(
      String namespace, String statCode, String userId, String additionalKey, StatResetInfo body) {
    this.namespace = namespace;
    this.statCode = statCode;
    this.userId = userId;
    this.additionalKey = additionalKey;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.statCode != null) {
      pathParams.put("statCode", this.statCode);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "additionalKey", this.additionalKey == null ? null : Arrays.asList(this.additionalKey));
    return queryParams;
  }

  @Override
  public StatResetInfo getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.statCode == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public StatItemIncResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new StatItemIncResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("additionalKey", "None");
    return result;
  }
}

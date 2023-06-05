/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.reward;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * checkEventCondition
 *
 * <p>[TEST FACILITY ONLY] Forbidden in live environment. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:REWARD", action=2 (READ) *
 * Returns : match result
 */
@Getter
@Setter
public class CheckEventCondition extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/rewards/{rewardId}/match";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String rewardId;
  private EventPayload body;

  /**
   * @param namespace required
   * @param rewardId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CheckEventCondition(String namespace, String rewardId, EventPayload body) {
    this.namespace = namespace;
    this.rewardId = rewardId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.rewardId != null) {
      pathParams.put("rewardId", this.rewardId);
    }
    return pathParams;
  }

  @Override
  public EventPayload getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.rewardId == null) {
      return false;
    }
    return true;
  }

  public ConditionMatchResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ConditionMatchResult().createFromJson(json);
  }
}

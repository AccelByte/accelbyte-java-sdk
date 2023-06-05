/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.operations.match_pools;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * CreateMatchPool
 *
 * <p>Required Permission: NAMESPACE:{namespace}:MATCHMAKING:POOL [CREATE]
 *
 * <p>Required Scope: social
 *
 * <p>Creates a new matchmaking pool.
 *
 * <p>A pool is isolated from other pools (i.e. tickets may be matched with other tickets in the
 * same pool, but not with tickets in other pools). Each pool has its own matchmaking rules and/or
 * logic.
 *
 * <p>ticket_expiration_seconds and backfill_ticket_expiration_seconds will be set to 300 seconds (5
 * minutes) by default if not filled.
 *
 * <p>Match Function holds information about the name of the match logic server that matchmaking can
 * refers to. By default we provide ("default" and "basic"). Match Function will be used as
 * reference value for Match Function Overrides if not set. In case Customer would like to use
 * matchmaking service default match logic, then specify it in "match_function_overrides". This
 * sample configuration will let matchmaking service will use "default" match logic for make
 * matches, while validation will hit both "default" and "custom" match logics. e.g. {
 * "match_function": "custom", "match_function_overrides": { "validation": []{"default","custom"},
 * "make_matches": "default", } }
 */
@Getter
@Setter
public class CreateMatchPool extends Operation {
  /** generated field's value */
  private String path = "/match2/v1/namespaces/{namespace}/match-pools";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ApiMatchPool body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateMatchPool(String namespace, ApiMatchPool body) {
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
  public ApiMatchPool getBodyParams() {
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

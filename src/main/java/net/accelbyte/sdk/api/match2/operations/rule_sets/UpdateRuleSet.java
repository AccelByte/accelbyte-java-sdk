/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.operations.rule_sets;

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
 * UpdateRuleSet
 *
 * <p>Required Permission: NAMESPACE:{namespace}:MATCHMAKING:RULES [UPDATE]
 *
 * <p>Required Scope: social
 *
 * <p>Updates an existing matchmaking rule set.
 *
 * <p>To use custom rules set please set enable_custom_match_function=true. Default (false).
 */
@Getter
@Setter
public class UpdateRuleSet extends Operation {
  /** generated field's value */
  private String path = "/match2/v1/namespaces/{namespace}/rulesets/{ruleset}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String ruleset;
  private ApiRuleSetPayload body;

  /**
   * @param namespace required
   * @param ruleset required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateRuleSet(String namespace, String ruleset, ApiRuleSetPayload body) {
    this.namespace = namespace;
    this.ruleset = ruleset;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.ruleset != null) {
      pathParams.put("ruleset", this.ruleset);
    }
    return pathParams;
  }

  @Override
  public ApiRuleSetPayload getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.ruleset == null) {
      return false;
    }
    return true;
  }

  public ApiRuleSetPayload parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApiRuleSetPayload().createFromJson(json);
  }
}

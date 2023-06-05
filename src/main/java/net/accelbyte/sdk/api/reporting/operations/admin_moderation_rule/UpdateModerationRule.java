/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.operations.admin_moderation_rule;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.reporting.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * updateModerationRule
 *
 * <p>This endpoint update moderation rule.
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:RULE [UPDATE]
 *
 * <p>Supported Category:
 *
 * <p>* UGC * USER * CHAT * EXTENSION
 *
 * <p>Supported Action (GOING TO DEPRECATE, for replacement please use "actions"):
 *
 * <p>* HideContent
 *
 * <p>Supported Actions:
 *
 * <p>* hideContent : Hide the content
 *
 * <p>* banAccount : Ban the user account
 *
 * <p>* deleteChat : Delete chat
 */
@Getter
@Setter
public class UpdateModerationRule extends Operation {
  /** generated field's value */
  private String path = "/reporting/v1/admin/namespaces/{namespace}/rule/{ruleId}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String ruleId;
  private RestapiModerationRuleRequest body;

  /**
   * @param namespace required
   * @param ruleId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateModerationRule(String namespace, String ruleId, RestapiModerationRuleRequest body) {
    this.namespace = namespace;
    this.ruleId = ruleId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.ruleId != null) {
      pathParams.put("ruleId", this.ruleId);
    }
    return pathParams;
  }

  @Override
  public RestapiModerationRuleRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.ruleId == null) {
      return false;
    }
    return true;
  }

  public RestapiModerationRuleResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new RestapiModerationRuleResponse().createFromJson(json);
  }
}

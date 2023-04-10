/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.operations.configuration;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * updateGroupConfigurationGlobalRuleAdminV1
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:GROUP:CONFIGURATION [UPDATE]'
 *
 * <p>This endpoint is used to update existing global rule configuration based on the allowed
 * action. It will replace the permission with the request
 *
 * <p>Action Code: 73106
 */
@Getter
@Setter
public class UpdateGroupConfigurationGlobalRuleAdminV1 extends Operation {
  /** generated field's value */
  private String path =
      "/group/v1/admin/namespaces/{namespace}/configuration/{configurationCode}/rules/{allowedAction}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String allowedAction;

  private String configurationCode;
  private String namespace;
  private ModelsUpdateGroupConfigurationGlobalRulesRequestV1 body;

  /**
   * @param allowedAction required
   * @param configurationCode required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateGroupConfigurationGlobalRuleAdminV1(
      String allowedAction,
      String configurationCode,
      String namespace,
      ModelsUpdateGroupConfigurationGlobalRulesRequestV1 body) {
    this.allowedAction = allowedAction;
    this.configurationCode = configurationCode;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.allowedAction != null) {
      pathParams.put("allowedAction", this.allowedAction);
    }
    if (this.configurationCode != null) {
      pathParams.put("configurationCode", this.configurationCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelsUpdateGroupConfigurationGlobalRulesRequestV1 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.allowedAction == null) {
      return false;
    }
    if (this.configurationCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsUpdateGroupConfigurationResponseV1 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsUpdateGroupConfigurationResponseV1().createFromJson(json);
  }
}

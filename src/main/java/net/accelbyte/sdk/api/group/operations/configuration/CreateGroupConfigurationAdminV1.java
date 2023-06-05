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
 * createGroupConfigurationAdminV1
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:GROUP:CONFIGURATION [CREATE]'
 *
 * <p>This endpoint is used to create new configuration. Before creating the configuration, make
 * sure that member role for admin and group member are already created before.
 *
 * <p>For each of the global rule, it will be the rule detail that consists of these fields:
 *
 * <p>* ruleAttribute : attribute of the player that needs to be checked
 *
 * <p>* ruleCriteria : criteria of the value. The value will be in enum of EQUAL, MINIMUM, MAXIMUM
 *
 * <p>* ruleValue : value that needs to be checked
 *
 * <p>Allowed Action can only be filled with any available action in the Group Service. For the
 * configuration, the only value is "createGroup"
 *
 * <p>Action Code: 73103
 */
@Getter
@Setter
public class CreateGroupConfigurationAdminV1 extends Operation {
  /** generated field's value */
  private String path = "/group/v1/admin/namespaces/{namespace}/configuration";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ModelsCreateGroupConfigurationRequestV1 body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateGroupConfigurationAdminV1(
      String namespace, ModelsCreateGroupConfigurationRequestV1 body) {
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
  public ModelsCreateGroupConfigurationRequestV1 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsCreateGroupConfigurationResponseV1 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsCreateGroupConfigurationResponseV1().createFromJson(json);
  }
}

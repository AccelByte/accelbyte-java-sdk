/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.configuration_template;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminCreateConfigurationTemplateV1
 *
 * <p>Create template configuration to be applied across party and session. Session configuration
 * mandatory : - name - joinability (example value : OPEN, CLOSED, INVITE_ONLY) - Type (example
 * value : P2P, DS, NONE) if type empty, type will be assign to NONE - MinPlayers (must greather or
 * equal 0) - MaxPlayers (must greather than 0) - InviteTimeout (must greather or equal 0) if
 * InviteTimeout equal 0 will be use default DefaultTimeoutSecond (60s) - InactiveTimeout (must
 * greather or equal 0) if InactiveTimeout equal 0 will be use default DefaultTimeoutSecond (60s) -
 * Persistent Flag only can use with type DS (example value true or false)
 */
@Getter
@Setter
public class AdminCreateConfigurationTemplateV1 extends Operation {
  /** generated field's value */
  private String path = "/session/v1/admin/namespaces/{namespace}/configuration";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private ApimodelsCreateConfigurationTemplateRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminCreateConfigurationTemplateV1(
      String namespace, ApimodelsCreateConfigurationTemplateRequest body) {
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
  public ApimodelsCreateConfigurationTemplateRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelsConfigurationTemplateResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsConfigurationTemplateResponse().createFromJson(json);
  }
}

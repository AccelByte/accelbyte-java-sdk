/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.managed_resources_key_value;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * CreateKeyValueCredentialV2
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:KEYVALUE:CREDENTIALS [CREATE]`
 *
 * <p>Generates a new credential for an extend app that is already integrated with a KeyValue
 * cluster. Replaces the old credential. Integration status will transition to MODIFYING, then READY
 * when complete. If the same username and password are provided, returns the existing credential
 * (idempotent).
 *
 * <p>Acknowledgement for secure credential handling is only required at integrate-app; not needed
 * for this endpoint.
 */
@Getter
@Setter
public class CreateKeyValueCredentialV2 extends Operation {
  /** generated field's value */
  private String path = "/csm/v2/admin/namespaces/{namespace}/apps/{app}/keyvalue/credentials";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String app;

  private String namespace;
  private ApimodelCreateKeyValueCredentialRequest body;

  /**
   * @param app required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateKeyValueCredentialV2(
      String app, String namespace, ApimodelCreateKeyValueCredentialRequest body) {
    this.app = app;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.app != null) {
      pathParams.put("app", this.app);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ApimodelCreateKeyValueCredentialRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.app == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ApimodelCreateKeyValueCredentialResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelCreateKeyValueCredentialResponse().createFromJson(json);
  }
}

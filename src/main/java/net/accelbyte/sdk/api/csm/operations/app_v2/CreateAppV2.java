/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.app_v2;

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
 * CreateAppV2
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:APP [CREATE]`
 *
 * <p>Create new extend app with name provided by {app} path parameter and specified scenario type
 *
 * <p>Available scenario: - scenario 1: `function-override` - scenario 2: `service-extension` -
 * scenario 3: `event-handler`
 *
 * <p>Available app status: - `app-creating` - `app-creation-failed` - `app-creation-timeout` -
 * `app-undeployed` - `deployment-in-progress` - `deployment-failed` - `deployment-timeout` -
 * `deployment-running` - `deployment-down` - `app-stopping` - `app-stop-failed` -
 * `app-stop-timeout` - `app-stopped` - `app-removing` - `app-removed` - `app-remove-timeout`
 */
@Getter
@Setter
public class CreateAppV2 extends Operation {
  /** generated field's value */
  private String path = "/csm/v2/admin/namespaces/{namespace}/apps/{app}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String app;

  private String namespace;
  private ApimodelCreateAppV2Request body;

  /**
   * @param app required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateAppV2(String app, String namespace, ApimodelCreateAppV2Request body) {
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
  public ApimodelCreateAppV2Request getBodyParams() {
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

  public ApimodelAppItem parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelAppItem().createFromJson(json);
  }
}

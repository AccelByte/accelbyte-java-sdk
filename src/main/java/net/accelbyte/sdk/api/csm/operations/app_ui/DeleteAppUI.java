/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.app_ui;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * DeleteAppUI
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:APPUI [DELETE]`
 *
 * <p>Permanently deletes an App UI instance and schedules cleanup of associated S3 assets.
 */
@Getter
@Setter
public class DeleteAppUI extends Operation {
  /** generated field's value */
  private String path = "/csm/v1/admin/namespaces/{namespace}/app-ui/{appUiName}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json", "multipart/form-data");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String appUiName;

  private String namespace;

  /**
   * @param appUiName required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteAppUI(String appUiName, String namespace) {
    this.appUiName = appUiName;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.appUiName != null) {
      pathParams.put("appUiName", this.appUiName);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.appUiName == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

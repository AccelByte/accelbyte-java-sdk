/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operations.development;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * DevelopmentServerConfigurationPatch
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:ARMADA:FLEET [UPDATE]
 */
@Getter
@Setter
public class DevelopmentServerConfigurationPatch extends Operation {
  /** generated field's value */
  private String path =
      "/ams/v1/admin/namespaces/{namespace}/development/server-configurations/{developmentServerConfigID}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String developmentServerConfigID;

  private String namespace;
  private ApiDevelopmentServerConfigurationUpdateRequest body;

  /**
   * @param developmentServerConfigID required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DevelopmentServerConfigurationPatch(
      String developmentServerConfigID,
      String namespace,
      ApiDevelopmentServerConfigurationUpdateRequest body) {
    this.developmentServerConfigID = developmentServerConfigID;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.developmentServerConfigID != null) {
      pathParams.put("developmentServerConfigID", this.developmentServerConfigID);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ApiDevelopmentServerConfigurationUpdateRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.developmentServerConfigID == null) {
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

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

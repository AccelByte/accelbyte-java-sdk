/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.sso_credential;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * RetrieveSSOLoginPlatformCredential
 *
 * <p>This is the API to Get SSO Platform Credential. It needs
 * ADMIN:NAMESPACE:{namespace}:PLATFORM:{platformId}:SSO [READ] resource
 */
@Getter
@Setter
public class RetrieveSSOLoginPlatformCredential extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/sso";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String platformId;

  /**
   * @param namespace required
   * @param platformId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrieveSSOLoginPlatformCredential(String namespace, String platformId) {
    this.namespace = namespace;
    this.platformId = platformId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.platformId != null) {
      pathParams.put("platformId", this.platformId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platformId == null) {
      return false;
    }
    return true;
  }

  public ModelSSOPlatformCredentialResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelSSOPlatformCredentialResponse().createFromJson(json);
  }
}

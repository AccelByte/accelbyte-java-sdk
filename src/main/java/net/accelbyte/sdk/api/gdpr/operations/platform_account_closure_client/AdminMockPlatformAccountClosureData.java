/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.platform_account_closure_client;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminMockPlatformAccountClosureData
 *
 * <p>Mock platform account closure data. ----- **This is only for testing** Platform: -
 * steamnetwork - xbox - psn Scope: account
 */
@Getter
@Setter
public class AdminMockPlatformAccountClosureData extends Operation {
  /** generated field's value */
  private String path = "/gdpr/admin/namespaces/{namespace}/platforms/{platform}/closure/mock";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platform;
  private DtoPlatformAccountClosureMockRequest body;

  /**
   * @param namespace required
   * @param platform required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminMockPlatformAccountClosureData(
      String namespace, String platform, DtoPlatformAccountClosureMockRequest body) {
    this.namespace = namespace;
    this.platform = platform;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.platform != null) {
      pathParams.put("platform", this.platform);
    }
    return pathParams;
  }

  @Override
  public DtoPlatformAccountClosureMockRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platform == null) {
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

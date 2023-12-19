/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension;

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
 * RequestTokenExchangeCodeV3
 *
 * <p>This endpoint is being used to request the code to exchange a new token. The target new
 * token's clientId should NOT be same with current using one. Path namespace should be target
 * namespace. Client ID should match the target namespace.
 *
 * <p>The code in response can be consumed by `/iam/v3/token/exchange`
 */
@Getter
@Setter
public class RequestTokenExchangeCodeV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/namespace/{namespace}/token/request";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String clientId;

  /**
   * @param namespace required
   * @param clientId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RequestTokenExchangeCodeV3(String namespace, String clientId) {
    this.namespace = namespace;
    this.clientId = clientId;

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
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.clientId != null) {
      formDataParams.put("client_id", this.clientId);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.clientId == null) {
      return false;
    }
    return true;
  }

  public OauthmodelTargetTokenCodeResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthmodelTargetTokenCodeResponse().createFromJson(json);
  }
}

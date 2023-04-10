/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * RevokeToken
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Revokes a token.
 *
 * <p>This endpoint requires all requests to have Authorization header set with Basic access
 * authentication constructed from client id and client secret or Bearer access authentication with
 * valid access token.
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint: /v3/oauth/revoke [POST]
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class RevokeToken extends Operation {
  /** generated field's value */
  private String path = "/iam/oauth/revoke/token";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String token;

  /**
   * @param token required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RevokeToken(String token) {
    this.token = token;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.token != null) {
      formDataParams.put("token", this.token);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.token == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

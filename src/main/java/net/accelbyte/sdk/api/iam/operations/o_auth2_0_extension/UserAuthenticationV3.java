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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * UserAuthenticationV3
 *
 * <p>This endpoint is being used to authenticate a user account. It validates user's email /
 * username and password. Deactivated or login-banned users are unable to login. Redirect URI and
 * Client ID must be specified as a pair and only used to redirect to the specified redirect URI in
 * case the requestId is no longer valid.
 *
 * <p>## Device Cookie Validation
 *
 * <p>Device Cookie is used to protect the user account from brute force login attack, [more detail
 * from
 * OWASP](https://owasp.org/www-community/Slow_Down_Online_Guessing_Attacks_with_Device_Cookies).
 * This endpoint will read device cookie from cookie **auth-trust-id**. If device cookie not found,
 * it will generate a new one and set it into cookie when successfully authenticate.
 *
 * <p>Action code: 10801
 */
@Getter
@Setter
public class UserAuthenticationV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/authenticate";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = "code";

  /** fields as input parameter */
  private String clientId;

  private Boolean extendExp;
  private String redirectUri;
  private String password;
  private String requestId;
  private String userName;

  /**
   * @param password required
   * @param requestId required
   * @param userName required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UserAuthenticationV3(
      String clientId,
      Boolean extendExp,
      String redirectUri,
      String password,
      String requestId,
      String userName) {
    this.clientId = clientId;
    this.extendExp = extendExp;
    this.redirectUri = redirectUri;
    this.password = password;
    this.requestId = requestId;
    this.userName = userName;

    securities.add("Basic");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.clientId != null) {
      formDataParams.put("client_id", this.clientId);
    }
    if (this.extendExp != null) {
      formDataParams.put(
          "extend_exp", this.extendExp == null ? null : String.valueOf(this.extendExp));
    }
    if (this.redirectUri != null) {
      formDataParams.put("redirect_uri", this.redirectUri);
    }
    if (this.password != null) {
      formDataParams.put("password", this.password);
    }
    if (this.requestId != null) {
      formDataParams.put("request_id", this.requestId);
    }
    if (this.userName != null) {
      formDataParams.put("user_name", this.userName);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.password == null) {
      return false;
    }
    if (this.requestId == null) {
      return false;
    }
    if (this.userName == null) {
      return false;
    }
    return true;
  }

  public String parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final String json = Helper.convertInputStreamToString(payload);
    if (code != 302) {
      throw new HttpResponseException(code, json);
    }
    return json;
  }
}

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
 * AuthenticationWithPlatformLinkV3
 *
 * <p>This endpoint is being used to authenticate a user account and perform platform link. It
 * validates user's email / username and password. If user already enable 2FA, then invoke
 * /mfa/verify using mfa_token from this endpoint response.
 *
 * <p>## Device Cookie Validation
 *
 * <p>Device Cookie is used to protect the user account from brute force login attack, [more detail
 * from OWASP. This endpoint will read device cookie from cookie auth-trust-id. If device cookie not
 * found, it will generate a new one and set it into cookie when successfully authenticate.
 */
@Getter
@Setter
public class AuthenticationWithPlatformLinkV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/authenticateWithLink";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private Boolean extendExp;

  private String clientId;
  private String linkingToken;
  private String password;
  private String username;

  /**
   * @param clientId required
   * @param linkingToken required
   * @param password required
   * @param username required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AuthenticationWithPlatformLinkV3(
      Boolean extendExp, String clientId, String linkingToken, String password, String username) {
    this.extendExp = extendExp;
    this.clientId = clientId;
    this.linkingToken = linkingToken;
    this.password = password;
    this.username = username;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.extendExp != null) {
      formDataParams.put(
          "extend_exp", this.extendExp == null ? null : String.valueOf(this.extendExp));
    }
    if (this.clientId != null) {
      formDataParams.put("client_id", this.clientId);
    }
    if (this.linkingToken != null) {
      formDataParams.put("linkingToken", this.linkingToken);
    }
    if (this.password != null) {
      formDataParams.put("password", this.password);
    }
    if (this.username != null) {
      formDataParams.put("username", this.username);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.clientId == null) {
      return false;
    }
    if (this.linkingToken == null) {
      return false;
    }
    if (this.password == null) {
      return false;
    }
    if (this.username == null) {
      return false;
    }
    return true;
  }

  public OauthmodelTokenResponseV3 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthmodelTokenResponseV3().createFromJson(json);
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

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
 * TokenGrantV3
 *
 * <p>This endpoint supports grant type:
 *
 * <p>1. Grant Type == `authorization_code`:
 *
 * <p>It generates the user token by given the authorization code which generated in
 * "/iam/v3/authenticate" API response. It should also pass in the redirect_uri, which should be the
 * same as generating the authorization code request.
 *
 * <p>2. Grant Type == `password`:
 *
 * <p>The grant type to use for authenticating a user, whether it's by email / username and password
 * combination or through platform.
 *
 * <p>3. Grant Type == `refresh_token`:
 *
 * <p>Used to get a new access token for a valid refresh token.
 *
 * <p>4. Grant Type == `client_credentials`:
 *
 * <p>It generates a token by checking the client credentials provided through Authorization header.
 *
 * <p>## Access Token Content
 *
 * <p>Following is the access tokenâs content:
 *
 * <p>*
 *
 * <p>namespace. It is the namespace the token was generated from.
 *
 * <p>*
 *
 * <p>display_name. The display name of the sub. It is empty if the token is generated from the
 * client credential
 *
 * <p>*
 *
 * <p>roles. The subâs roles. It is empty if the token is generated from the client credential
 *
 * <p>*
 *
 * <p>namespace_roles. The subâs roles scoped to namespace. Improvement from roles, which make the
 * role scoped to specific namespace instead of global to publisher namespace
 *
 * <p>*
 *
 * <p>permissions. The sub or audâ permissions
 *
 * <p>*
 *
 * <p>bans. The subâs list of bans. It is used by the IAM client for validating the token.
 *
 * <p>*
 *
 * <p>jflgs. It stands for Justice Flags. It is a special flag used for storing additional status
 * information regarding the sub. It is implemented as a bit mask. Following explains what each bit
 * represents:
 *
 * <p>* 1: Email Address Verified
 *
 * <p>* 2: Phone Number Verified
 *
 * <p>* 4: Anonymous
 *
 * <p>* 8: Suspicious Login
 *
 * <p>*
 *
 * <p>aud. The aud is the targeted resource server.
 *
 * <p>*
 *
 * <p>iat. The time the token issues at. It is in Epoch time format
 *
 * <p>*
 *
 * <p>exp. The time the token expires. It is in Epoch time format
 *
 * <p>*
 *
 * <p>client_id. The UserID. The sub is omitted if the token is generated from client credential
 *
 * <p>*
 *
 * <p>scope. The scope of the access request, expressed as a list of space-delimited, case-sensitive
 * strings
 *
 * <p>## Bans
 *
 * <p>The JWT contains user's active bans with its expiry date. List of ban types can be obtained
 * from /bans.
 *
 * <p>## Device Cookie Validation
 *
 * <p>For grant type "password" only
 *
 * <p>Device Cookie is used to protect the user account from brute force login attack, [more detail
 * from OWASP.
 *
 * <p>This endpoint will read device cookie from request header Auth-Trust-Id. If device cookie not
 * found, it will generate a new one and set it into response body auth_trust_id when successfully
 * login.
 *
 * <p>## Track Login History
 *
 * <p>This endpoint will track login history to detect suspicious login activity, please provide
 * Device-Id (alphanumeric) in request header parameter otherwise it will set to "unknown".
 *
 * <p>Align with General Data Protection Regulation in Europe, user login history will be kept
 * within 28 days by default"
 *
 * <p>## 2FA remember device
 *
 * <p>To remember device for 2FA, should provide cookie: device_token or header: Device-Token
 *
 * <p>action code: 10703
 */
@Getter
@Setter
public class TokenGrantV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/oauth/token";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String clientId;

  private String code;
  private String codeVerifier;
  private Boolean extendExp;
  private String password;
  private String redirectUri;
  private String refreshToken;
  private String username;
  private String grantType;

  /**
   * @param grantType required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public TokenGrantV3(
      String clientId,
      String code,
      String codeVerifier,
      Boolean extendExp,
      String password,
      String redirectUri,
      String refreshToken,
      String username,
      String grantType) {
    this.clientId = clientId;
    this.code = code;
    this.codeVerifier = codeVerifier;
    this.extendExp = extendExp;
    this.password = password;
    this.redirectUri = redirectUri;
    this.refreshToken = refreshToken;
    this.username = username;
    this.grantType = grantType;

    securities.add("Basic");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.clientId != null) {
      formDataParams.put("client_id", this.clientId);
    }
    if (this.code != null) {
      formDataParams.put("code", this.code);
    }
    if (this.codeVerifier != null) {
      formDataParams.put("code_verifier", this.codeVerifier);
    }
    if (this.extendExp != null) {
      formDataParams.put(
          "extend_exp", this.extendExp == null ? null : String.valueOf(this.extendExp));
    }
    if (this.password != null) {
      formDataParams.put("password", this.password);
    }
    if (this.redirectUri != null) {
      formDataParams.put("redirect_uri", this.redirectUri);
    }
    if (this.refreshToken != null) {
      formDataParams.put("refresh_token", this.refreshToken);
    }
    if (this.username != null) {
      formDataParams.put("username", this.username);
    }
    if (this.grantType != null) {
      formDataParams.put("grant_type", this.grantType);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.grantType == null) {
      return false;
    }
    return true;
  }

  public OauthmodelTokenWithDeviceCookieResponseV3 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthmodelTokenWithDeviceCookieResponseV3().createFromJson(json);
  }

  public enum GrantType {
    AuthorizationCode("authorization_code"),
    ClientCredentials("client_credentials"),
    Password("password"),
    RefreshToken("refresh_token");

    private String value;

    GrantType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class TokenGrantV3Builder {
    private String grantType;

    public TokenGrantV3Builder grantType(final String grantType) {
      this.grantType = grantType;
      return this;
    }

    public TokenGrantV3Builder grantTypeFromEnum(final GrantType grantType) {
      this.grantType = grantType.toString();
      return this;
    }
  }
}

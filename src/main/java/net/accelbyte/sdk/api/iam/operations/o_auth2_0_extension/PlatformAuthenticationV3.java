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
 * PlatformAuthenticationV3
 *
 * <p>This endpoint authenticates user platform. It validates user to its respective platforms.
 * Deactivated or login-banned users are unable to login.
 *
 * <p>If already linked with justice account or match SSO condition, will redirect to client's
 * redirect url with code. then invoke '/iam/v3/oauth/token' with grant_type=authorization_code
 *
 * <p>If already not linked with justice account and not match SSO condition, will redirect to
 * client's account linking page
 *
 * <p>## Supported platforms:
 *
 * <p>* steamopenid Steam login page will redirects to this endpoint after login success as
 * previously defined on openID request parameter `openid.return_to` when request login to steam
 * https://openid.net/specs/openid-authentication-2_0.html#anchor27
 *
 * <p>* ps4web PS4 login page will redirects to this endpoint after login success as previously
 * defined on authorize request parameter `redirect_uri`
 * https://ps4.siedev.net/resources/documents/WebAPI/1/Auth_WebAPI-Reference/0002.html#0GetAccessTokenUsingAuthorizationCode
 *
 * <p>* xblweb XBL login page will redirects to this endpoint after login success as previously
 * defined on authorize request parameter `redirect_uri`
 *
 * <p>* epicgames Epicgames login page will redirects to this endpoint after login success or an
 * error occurred. If error, it redirects to the login page.
 *
 * <p>* twitch Twitch login page will redirects to this endpoint after login success as previously
 * defined on authorize request parameter `redirect_uri`
 *
 * <p>* facebook Facebook login page will redirects to this endpoint after login success as
 * previously defined on authorize request parameter `redirect_uri`
 *
 * <p>* google Google login page will redirects to this endpoint after login success as previously
 * defined on authorize request parameter `redirect_uri`
 *
 * <p>* snapchat Snapchat login page will redirects to this endpoint after login success as
 * previously defined on authorize request parameter `redirect_uri`
 *
 * <p>* discord Discord login page will redirects to this endpoint after login success as previously
 * defined on authorize request parameter `redirect_uri` action code : 10709
 */
@Getter
@Setter
public class PlatformAuthenticationV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/platforms/{platformId}/authenticate";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("*/*");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = "PLACEHOLDER";
  /** fields as input parameter */
  private String platformId;

  private String code;
  private String error;
  private String openidAssocHandle;
  private String openidClaimedId;
  private String openidIdentity;
  private String openidMode;
  private String openidNs;
  private String openidOpEndpoint;
  private String openidResponseNonce;
  private String openidReturnTo;
  private String openidSig;
  private String openidSigned;
  private String state;

  /**
   * @param platformId required
   * @param state required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PlatformAuthenticationV3(
      String platformId,
      String code,
      String error,
      String openidAssocHandle,
      String openidClaimedId,
      String openidIdentity,
      String openidMode,
      String openidNs,
      String openidOpEndpoint,
      String openidResponseNonce,
      String openidReturnTo,
      String openidSig,
      String openidSigned,
      String state) {
    this.platformId = platformId;
    this.code = code;
    this.error = error;
    this.openidAssocHandle = openidAssocHandle;
    this.openidClaimedId = openidClaimedId;
    this.openidIdentity = openidIdentity;
    this.openidMode = openidMode;
    this.openidNs = openidNs;
    this.openidOpEndpoint = openidOpEndpoint;
    this.openidResponseNonce = openidResponseNonce;
    this.openidReturnTo = openidReturnTo;
    this.openidSig = openidSig;
    this.openidSigned = openidSigned;
    this.state = state;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.platformId != null) {
      pathParams.put("platformId", this.platformId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("code", this.code == null ? null : Arrays.asList(this.code));
    queryParams.put("error", this.error == null ? null : Arrays.asList(this.error));
    queryParams.put(
        "openid.assoc_handle",
        this.openidAssocHandle == null ? null : Arrays.asList(this.openidAssocHandle));
    queryParams.put(
        "openid.claimed_id",
        this.openidClaimedId == null ? null : Arrays.asList(this.openidClaimedId));
    queryParams.put(
        "openid.identity", this.openidIdentity == null ? null : Arrays.asList(this.openidIdentity));
    queryParams.put("openid.mode", this.openidMode == null ? null : Arrays.asList(this.openidMode));
    queryParams.put("openid.ns", this.openidNs == null ? null : Arrays.asList(this.openidNs));
    queryParams.put(
        "openid.op_endpoint",
        this.openidOpEndpoint == null ? null : Arrays.asList(this.openidOpEndpoint));
    queryParams.put(
        "openid.response_nonce",
        this.openidResponseNonce == null ? null : Arrays.asList(this.openidResponseNonce));
    queryParams.put(
        "openid.return_to",
        this.openidReturnTo == null ? null : Arrays.asList(this.openidReturnTo));
    queryParams.put("openid.sig", this.openidSig == null ? null : Arrays.asList(this.openidSig));
    queryParams.put(
        "openid.signed", this.openidSigned == null ? null : Arrays.asList(this.openidSigned));
    queryParams.put("state", this.state == null ? null : Arrays.asList(this.state));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.platformId == null) {
      return false;
    }
    if (this.state == null) {
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

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("code", "None");
    result.put("error", "None");
    result.put("openid.assoc_handle", "None");
    result.put("openid.claimed_id", "None");
    result.put("openid.identity", "None");
    result.put("openid.mode", "None");
    result.put("openid.ns", "None");
    result.put("openid.op_endpoint", "None");
    result.put("openid.response_nonce", "None");
    result.put("openid.return_to", "None");
    result.put("openid.sig", "None");
    result.put("openid.signed", "None");
    result.put("state", "None");
    return result;
  }
}

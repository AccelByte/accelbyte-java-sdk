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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AuthCodeRequestV3
 *
 * <p>Generate url to request auth code from third party platform
 *
 * <p>## Supported platforms:
 *
 * <p>* steamopenid This endpoint redirects to steam login page, then redirect back to platform
 * authenticate endpoint after successfully authenticating user steam.
 *
 * <p>* xblweb This endpoint redirects to xbox login page, then redirect back to platform
 * authenticate endpoint after successfully authenticating xbox user.
 *
 * <p>* ps4web This endpoint redirects to psn login page, then redirect back to platform
 * authenticate endpoint after successfully authenticating psn user.
 *
 * <p>* epicgames This endpoint redirects to Epicgames OAuth login page. then redirect to platform
 * authenticate endpoint after successfully authenticating an Epicgames credential
 *
 * <p>* twitch This endpoint redirects to twitch login page, then redirect back to platform
 * authenticate endpoint after successfully authenticating twitch user.
 *
 * <p>* azure This endpoint redirects to azure login page, then redirect back to platform
 * authenticate(saml) endpoint after successfully authenticating azure user.
 *
 * <p>* facebook This endpoint redirects to facebook login page, then redirect back to platform
 * authenticate endpoint after successfully authenticating facebook user.
 *
 * <p>* google This endpoint redirects to google login page, then redirect back to platform
 * authenticate endpoint after successfully authenticating google user.
 *
 * <p>* snapchat This endpoint redirects to snapchat login page, then redirect back to platform
 * authenticate endpoint after successfully authenticating snapchat user. action code : 10702'
 */
@Getter
@Setter
public class AuthCodeRequestV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/oauth/platforms/{platformId}/authorize";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = "code";
  /** fields as input parameter */
  private String platformId;

  private String clientId;
  private String redirectUri;
  private String requestId;

  /**
   * @param platformId required
   * @param requestId required
   */
  @Builder
  public AuthCodeRequestV3(
      String platformId, String clientId, String redirectUri, String requestId) {
    this.platformId = platformId;
    this.clientId = clientId;
    this.redirectUri = redirectUri;
    this.requestId = requestId;

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
    queryParams.put("client_id", this.clientId == null ? null : Arrays.asList(this.clientId));
    queryParams.put(
        "redirect_uri", this.redirectUri == null ? null : Arrays.asList(this.redirectUri));
    queryParams.put("request_id", this.requestId == null ? null : Arrays.asList(this.requestId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.platformId == null) {
      return false;
    }
    if (this.requestId == null) {
      return false;
    }
    return true;
  }

  public String parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code != 302) {
      throw new HttpResponseException(code, json);
    }
    return json;
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("client_id", "None");
    result.put("redirect_uri", "None");
    result.put("request_id", "None");
    return result;
  }
}

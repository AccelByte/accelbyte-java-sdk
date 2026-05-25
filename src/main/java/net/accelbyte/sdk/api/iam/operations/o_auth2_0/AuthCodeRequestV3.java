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
 * <p>Generate url to request auth code from third party platform ## Supported platforms: -
 * **steamopenid** Redirects to steam login page, then redirects back to the platform authenticate
 * API after successfully authenticating user steam. - **xblweb** Redirects to xbox login page, then
 * redirects back to the platform authenticate API after successfully authenticating xbox user. -
 * **ps4web** Redirects to psn login page, then redirects back to the platform authenticate API
 * after successfully authenticating psn user. - **epicgames** Redirects to Epicgames OAuth login
 * page, then redirects to the platform authenticate API after successfully authenticating an
 * Epicgames credential. - **twitch** Redirects to twitch login page, then redirects back to the
 * platform authenticate API after successfully authenticating twitch user. - **azure** Redirects to
 * azure login page, then redirects back to the platform authenticate(saml) API after successfully
 * authenticating azure user. - **facebook** Redirects to facebook login page, then redirects back
 * to the platform authenticate API after successfully authenticating facebook user. - **google**
 * Redirects to google login page, then redirects back to the platform authenticate API after
 * successfully authenticating google user. - **snapchat** Redirects to snapchat login page, then
 * redirects back to the platform authenticate API after successfully authenticating snapchat user.
 * - **discord** Redirects to discord login page, then redirects back to the platform authenticate
 * API after successfully authenticating discord user. - **amazon** Redirects to amazon login page,
 * then redirects back to the platform authenticate API after successfully authenticating amazon
 * user. - **oculusweb** Redirects to oculus login page, then redirects back to Login Website page
 * after successfully authenticating oculus user.
 */
@Getter
@Setter
public class AuthCodeRequestV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/oauth/platforms/{platformId}/authorize";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("*/*");
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
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
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
    result.put("client_id", "None");
    result.put("redirect_uri", "None");
    result.put("request_id", "None");
    return result;
  }
}

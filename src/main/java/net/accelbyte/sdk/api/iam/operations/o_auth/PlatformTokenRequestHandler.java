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
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PlatformTokenRequestHandler
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>This endpoint requires all requests to have Authorization header set with Basic access
 * authentication constructed from client id and client secret. For publisher-game namespace schema
 * : Specify only either platform_token or device_id. Device token grant should be requested along
 * with device_id parameter against game namespace. Another 3rd party platform token grant should be
 * requested along with platform_token parameter against publisher namespace.
 *
 * <p>Supported platforms:
 *
 * <p>1. steamopenid : Steam's user authentication method using OpenID 2.0. The expected value of
 * the platform token is the URL generated by Steam on web authentication
 *
 * <p>The JWT contains user's active bans with its expiry date. List of ban types can be obtained
 * from /iam/bans.
 *
 * <p>. Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/oauth/platforms/{platformId}/token [POST]
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class PlatformTokenRequestHandler extends Operation {
  /** generated field's value */
  private String path = "/iam/oauth/namespaces/{namespace}/platforms/{platformId}/token";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private String deviceId;
  private String macAddress;
  private String platformToken;

  /**
   * @param namespace required
   * @param platformId required
   */
  @Builder
  /*
   *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
   */
  @Deprecated
  public PlatformTokenRequestHandler(
      String namespace,
      String platformId,
      String deviceId,
      String macAddress,
      String platformToken) {
    this.namespace = namespace;
    this.platformId = platformId;
    this.deviceId = deviceId;
    this.macAddress = macAddress;
    this.platformToken = platformToken;

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
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.deviceId != null) {
      formDataParams.put("device_id", this.deviceId);
    }
    if (this.macAddress != null) {
      formDataParams.put("macAddress", this.macAddress);
    }
    if (this.platformToken != null) {
      formDataParams.put("platform_token", this.platformToken);
    }
    return formDataParams;
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

  public OauthmodelTokenResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new OauthmodelTokenResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.clients;

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
 * AdminUpdateClientV3
 *
 * <p>Updates an OAuth 2.0 client. Protected by the permission: ADMIN:NAMESPACE:{namespace}:CLIENT
 * [UPDATE]. Specify only the fields you want to update in the request payload, e.g.
 * {"ClientName":"E-commerce", "BaseUri":"https://example.net"}
 *
 * <p>action code: 10302
 *
 * <p>Fields Description:
 *
 * <p>* clientName : The client name. It should not be empty if the field exists in the body. e.g
 * E-commerce
 *
 * <p>* namespace : The namespace where the client lives. e.g sample-game
 *
 * <p>* redirectUri : Contains the redirect URI used in OAuth callback. It should not be empty if
 * the field exists in the body. e.g https://example.net/platform
 *
 * <p>* audiences : List of target client IDs who is intended to receive the token. e.g
 * ["eaaa65618fe24293b00a61454182b435", "40073ee9bc3446d3a051a71b48509a5d"]
 *
 * <p>* baseUri : A base URI of the application. It is used in the audience checking for making sure
 * the token is used by the right resource server. Required if the application type is a server. e.g
 * https://example.net/platform
 *
 * <p>* clientPermissions : Contains the client's permissions
 *
 * <p>* deletable : The flag to identify whether client is deletable (optional). e.g. true
 *
 * <p>* clientPlatform : available client platform (optional). default value: "".
 *
 * <p>* Playstation
 *
 * <p>* Xbox
 *
 * <p>* Steam
 *
 * <p>* Epic
 *
 * <p>* IOS
 *
 * <p>* GooglePlay
 *
 * <p>* Nintendo
 *
 * <p>* twoFactorEnabled : The flag to indicate whether 2FA validation is enable for this client.
 * default value: false
 *
 * <p>* oauthAccessTokenExpiration : a configurable expiration time for access_token , default
 * value: 0 (mean fetch value from environment variable)
 *
 * <p>* oauthRefreshTokenExpiration : a configurable expiration time for refresh_token , default
 * value: 0 (mean fetch value from environment variable)
 *
 * <p>* oauthAccessTokenExpirationTimeUnit : a configurable expiration time unit for access_token ,
 * will use previous value if not specified
 *
 * <p>* oauthRefreshTokenExpirationTimeUnit : a configurable expiration time unit for refresh_token
 * , will use previous value if not specified
 */
@Getter
@Setter
public class AdminUpdateClientV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/clients/{clientId}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String clientId;

  private String namespace;
  private ClientmodelClientUpdateV3Request body;

  /**
   * @param clientId required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateClientV3(
      String clientId, String namespace, ClientmodelClientUpdateV3Request body) {
    this.clientId = clientId;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.clientId != null) {
      pathParams.put("clientId", this.clientId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ClientmodelClientUpdateV3Request getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.clientId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ClientmodelClientV3Response parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ClientmodelClientV3Response().createFromJson(json);
  }
}

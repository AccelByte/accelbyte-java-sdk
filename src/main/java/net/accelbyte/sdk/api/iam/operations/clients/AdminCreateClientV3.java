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
 * AdminCreateClientV3
 *
 * <p>Add a new OAuth 2.0 client. Protected by the permission: ADMIN:NAMESPACE:{namespace}:CLIENT
 * [CREATE]
 *
 * <p>A new client automatically granted with these scopes: commerce, account, analytics,
 * publishing, social.
 *
 * <p>Note for Multi Tenant Mode:
 *
 * <p>New Confidential Client will have Default Client Role assigned to it. The role will have all
 * permissions to access all APIs that's supported by game server SDK and DS uploader.
 *
 * <p>However if Game Admin create Confidential Client and the permission(s) are specified in
 * request body, then the Default Client Role will not be assigned.
 *
 * <p>But in this case, the assigned permissions will be restricted in the Default Client Permission
 * collection only.
 *
 * <p>action code: 10301
 *
 * <p>Fields Description:
 *
 * <p>* clientId : The client ID. e.g f815e5c44f364993961be3b3f26a7bf4
 *
 * <p>* clientName : The client name. e.g E-commerce
 *
 * <p>* secret : The client's secret. It's empty if the client's type is a public client. Otherwise,
 * the client secret is required
 *
 * <p>* namespace : The namespace where the client lives. e.g sample-game
 *
 * <p>* redirectUri : Contains the redirect URI used in OAuth callback. e.g
 * https://example.net/platform
 *
 * <p>* oauthClientType : The OAuth 2.0 client type. The client type determines whether the
 * authorization needs Proof Of Key Exchange or not. A public client type doesn't have a client
 * secret and should use PKCE flow. A confidential client type has a client secret and don't use
 * PKCE flow Supported oAuthClientType :
 *
 * <p>* Public
 *
 * <p>* Confidential
 *
 * <p>* audiences : List of target client IDs who is intended to receive the token. e.g
 * ["eaaa65618fe24293b00a61454182b435", "40073ee9bc3446d3a051a71b48509a5d"]
 *
 * <p>* baseUri : A base URI of the application. It is used for making sure the token is intended to
 * be used by the client. e.g https://example.net/platform
 *
 * <p>* clientPermissions : Contains the client's permissions
 *
 * <p>* deletable : The flag to identify whether client is deletable (optional). default value: true
 *
 * <p>* clientPlatform : available client platform (optional). default value: ""
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
 * <p>* Oculus
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
 * default value: SECONDS
 *
 * <p>* oauthRefreshTokenExpirationTimeUnit : a configurable expiration time unit for refresh_token
 * , default value: SECONDS
 */
@Getter
@Setter
public class AdminCreateClientV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/clients";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ClientmodelClientCreationV3Request body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminCreateClientV3(String namespace, ClientmodelClientCreationV3Request body) {
    this.namespace = namespace;
    this.body = body;

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
  public ClientmodelClientCreationV3Request getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ClientmodelClientV3Response parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ClientmodelClientV3Response().createFromJson(json);
  }
}

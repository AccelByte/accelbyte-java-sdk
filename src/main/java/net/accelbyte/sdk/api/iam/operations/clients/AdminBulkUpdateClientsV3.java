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
 * AdminBulkUpdateClientsV3
 *
 * <p>Updates multiple OAuth 2.0 clients. Specify only the fields you want to update in the request
 * payload, e.g. {"ClientName":"E-commerce", "BaseUri":"https://example.net"}
 *
 * <p>**Note for Multi Tenant Mode (Confidential Client):** Only Super admin can set permission with
 * resource & action. Studio admin & game admin need set permission with permission module.
 *
 * <p>action code: 10302
 *
 * <p>**Fields Description:** - **clientName** : The client name. It should not be empty if the
 * field exists in the body. e.g E-commerce - **namespace** : The namespace where the client lives.
 * e.g sample-game - **redirectUri** : Contains the redirect URI used in OAuth callback. It should
 * not be empty if the field exists in the body. e.g https://example.net/platform - **audiences** :
 * List of target client IDs who is intended to receive the token. e.g
 * ["eaaa65618fe24293b00a61454182b435", "40073ee9bc3446d3a051a71b48509a5d"] - **baseUri** : A base
 * URI of the application. It is used in the audience checking for making sure the token is used by
 * the right resource server. Required if the application type is a server. e.g
 * https://example.net/platform - **clientPermissions** : Contains the client's permissions -
 * **deletable** : The flag to identify whether client is deletable (optional). e.g. true -
 * **clientPlatform** : available client platform (optional). default value: "". - Playstation -
 * Xbox - Steam - Epic - IOS - GooglePlay - Nintendo - Oculus - **twoFactorEnabled**: The flag to
 * indicate whether 2FA validation is enable for this client. default value: false -
 * **oauthAccessTokenExpiration**: a configurable expiration time for **access_token**, default
 * value: 0 (mean fetch value from environment variable) - **oauthRefreshTokenExpiration**: a
 * configurable expiration time for **refresh_token**, default value: 0 (mean fetch value from
 * environment variable) - **oauthAccessTokenExpirationTimeUnit**: a configurable expiration time
 * unit for **access_token**, will use previous value if not specified -
 * **oauthRefreshTokenExpirationTimeUnit**: a configurable expiration time unit for
 * **refresh_token**, will use previous value if not specified - **skipLoginQueue**: a flag to
 * indicate whether this client should be exempted from login queue or not
 */
@Getter
@Setter
public class AdminBulkUpdateClientsV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/clients";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ClientmodelClientsUpdateRequestV3 body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminBulkUpdateClientsV3(String namespace, ClientmodelClientsUpdateRequestV3 body) {
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
  public ClientmodelClientsUpdateRequestV3 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.third_party_credential;

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
 * UpdateThirdPartyLoginPlatformCredentialV3
 *
 * <p>This is the API to Add 3rd Platform Credential.
 *
 * <p>It needs ADMIN:NAMESPACE:{namespace}:PLATFORM:{platformId}:CLIENT [CREATE] resource.
 *
 * <p>The secret for apple is base64 encoded private key.
 *
 * <p>No secret for awscognito , we only need to configure AWS Cognito Region and User Pool
 *
 * <p>The secret for discord is client secret of the twitch client id.
 *
 * <p>The secret for epicgames is client secret of the epicgames client id.
 *
 * <p>The secret for facebook is client secret of the facebook client id.
 *
 * <p>The secret for google is client secret of the google OAuth client.
 *
 * <p>No secret for nintendo , we only need to configure app id of the game
 *
 * <p>No secret for netflix , we configure the Root, Public, Private Key certificate pem file and
 * target environment; value: [sandbox, production]
 *
 * <p>The secret for oculus is app secret of the oculus app.
 *
 * <p>The secret for ps4, ps5, and ps4web is client secret of the psn web server.
 *
 * <p>The secret for steam is the Steam Web API Key.
 *
 * <p>The secret for steamopenid is the Steam Web API Key.
 *
 * <p>The secret for twitch is client secret of the twitch client.
 *
 * <p>The secret for live is the Relying Party Private Key in base64 encode PEM format.
 *
 * <p>The secret for xblwebapi is client secret of the xbl client.
 *
 * <p>If generic oauth flow is set to true:
 *
 * <p>* Current supported value for TokenAuthenticationType is code, idToken and bearerToken
 *
 * <p>* `TokenClaimsMapping` is used to extract user info from idToken claims or user info endpoint
 * response accessed using bearerToken. Its a JSON format with key should be `name`, `email` and
 * `avatarUrl` since IAM will look up for these key when extracting user info. default claims keys :
 * userIdentity/sub, name, email and avatarUrl/picture
 */
@Getter
@Setter
public class UpdateThirdPartyLoginPlatformCredentialV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/clients";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private ModelThirdPartyLoginPlatformCredentialRequest body;

  /**
   * @param namespace required
   * @param platformId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateThirdPartyLoginPlatformCredentialV3(
      String namespace, String platformId, ModelThirdPartyLoginPlatformCredentialRequest body) {
    this.namespace = namespace;
    this.platformId = platformId;
    this.body = body;

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
  public ModelThirdPartyLoginPlatformCredentialRequest getBodyParams() {
    return this.body;
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

  public ModelThirdPartyLoginPlatformCredentialResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelThirdPartyLoginPlatformCredentialResponse().createFromJson(json);
  }
}

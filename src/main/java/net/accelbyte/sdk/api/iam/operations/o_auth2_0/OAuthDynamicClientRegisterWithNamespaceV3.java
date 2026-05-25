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
 * OAuthDynamicClientRegisterWithNamespaceV3
 *
 * <p>Implements OAuth 2.0 Dynamic Client Registration Management Protocol as defined in RFC 7591.
 *
 * <p>Enables public users to register with an authorization server, obtaining an OAuth client
 * dynamically without manual intervention.
 *
 * <p>ð Standards Compliance: This API fully conforms to RFC 7591 specifications for OAuth 2.0
 * Dynamic Client Registration.
 *
 * <p>â ï¸ Security Notice: Protected by IP-based rate limiting to prevent abuse while maintaining
 * RFC 7591 compliance.
 */
@Getter
@Setter
public class OAuthDynamicClientRegisterWithNamespaceV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/oauth/namespace/{namespace}/register";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private OauthmodelClientRegistrationRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public OAuthDynamicClientRegisterWithNamespaceV3(
      String namespace, OauthmodelClientRegistrationRequest body) {
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
  public OauthmodelClientRegistrationRequest getBodyParams() {
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

  public OauthmodelClientRegisterResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthmodelClientRegisterResponse().createFromJson(json);
  }
}

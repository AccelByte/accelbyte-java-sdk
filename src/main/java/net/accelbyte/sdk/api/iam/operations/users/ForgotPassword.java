/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

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
 * ForgotPassword
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:PASSWORD:USER [UPDATE]' or valid basic auth
 * header
 *
 * <p>Special note for publisher-game scenario: Game Client should provide game namespace path
 * parameter and Publisher Client should provide publisher namespace path parameter.
 *
 * <p>The password reset code will be sent to the publisher account's email address.
 */
@Getter
@Setter
public class ForgotPassword extends Operation {
  /** generated field's value */
  private String path = "/iam/namespaces/{namespace}/users/forgotPassword";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private ModelSendVerificationCodeRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  public ForgotPassword(String namespace, ModelSendVerificationCodeRequest body) {
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
    securities.add("Basic");
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
  public ModelSendVerificationCodeRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

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
 * AdminSendVerificationCodeV3
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:USER:{userId} [UPDATE]'
 *
 * <p>The verification code is sent to email address.
 *
 * <p>Available contexts for use :
 *
 * <p>1. UserAccountRegistration
 *
 * <p>a context type used for verifying email address in user account registration. It returns 409
 * if the email address already verified. It is the default context if the Context field is empty
 *
 * <p>2. UpdateEmailAddress
 *
 * <p>a context type used for verify user before updating email address.(Without email address
 * verified checking)
 *
 * <p>3. upgradeHeadlessAccount
 *
 * <p>The context is intended to be used whenever the email address wanted to be automatically
 * verified on upgrading a headless account. If this context used, IAM rejects the request if the
 * email address is already used by others by returning HTTP Status Code 409.
 *
 * <p>action code: 10116
 */
@Getter
@Setter
public class AdminSendVerificationCodeV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/users/{userId}/code/request";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private ModelSendVerificationCodeRequestV3 body;

  /**
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminSendVerificationCodeV3(
      String namespace, String userId, ModelSendVerificationCodeRequestV3 body) {
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public ModelSendVerificationCodeRequestV3 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
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

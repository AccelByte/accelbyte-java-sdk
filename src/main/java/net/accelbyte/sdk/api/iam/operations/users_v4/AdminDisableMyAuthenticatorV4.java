/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

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
 * AdminDisableMyAuthenticatorV4
 *
 * <p>This endpoint is used to disable 2FA authenticator. ------ **Note**: **mfaToken** is required
 * when all the following are enabled: - The environment variable **SENSITIVE_MFA_AUTH_ENABLED** is
 * true - The **Two-Factor Authentication** is enabled in the IAM client where user logs in - Users
 * already enabled the MFA
 */
@Getter
@Setter
public class AdminDisableMyAuthenticatorV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/admin/users/me/mfa/authenticator/disable";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private ModelDisableMFARequest body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminDisableMyAuthenticatorV4(ModelDisableMFARequest body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public ModelDisableMFARequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
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

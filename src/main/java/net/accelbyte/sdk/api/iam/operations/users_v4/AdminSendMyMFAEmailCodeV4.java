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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminSendMyMFAEmailCodeV4
 *
 * <p>This endpoint is used to send email code. -------------- Supported actions: * ChangePassword *
 * DisableMFAEmail
 */
@Getter
@Setter
public class AdminSendMyMFAEmailCodeV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/admin/users/me/mfa/email/code";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String action;

  private String languageTag;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminSendMyMFAEmailCodeV4(String action, String languageTag) {
    this.action = action;
    this.languageTag = languageTag;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.action != null) {
      formDataParams.put("action", this.action);
    }
    if (this.languageTag != null) {
      formDataParams.put("languageTag", this.languageTag);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
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

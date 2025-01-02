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
 * PublicSendCodeForwardV3
 *
 * <p>This API need the upgradeToken in request body. Available contexts for use : 1.
 * **upgradeHeadlessAccount** The context is intended to be used whenever the email address wanted
 * to be automatically verified on upgrading a headless account. If this context used, IAM rejects
 * the request if the email address is already used by others by returning HTTP Status Code 409.
 */
@Getter
@Setter
public class PublicSendCodeForwardV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/users/me/code/request/forward";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private ModelSendVerificationCodeRequestV3 body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicSendCodeForwardV3(ModelSendVerificationCodeRequestV3 body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public ModelSendVerificationCodeRequestV3 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public String parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final String json = Helper.convertInputStreamToString(payload);
    if (code != 302) {
      throw new HttpResponseException(code, json);
    }
    return json;
  }
}

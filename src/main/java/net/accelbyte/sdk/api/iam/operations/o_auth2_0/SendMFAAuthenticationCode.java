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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * SendMFAAuthenticationCode
 *
 * <p>Send 2FA code
 *
 * <p>This endpoint is used for sending 2FA code.
 */
@Getter
@Setter
public class SendMFAAuthenticationCode extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/oauth/mfa/code";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String clientId;

  private String factor;
  private String mfaToken;

  /**
   * @param clientId required
   * @param factor required
   * @param mfaToken required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SendMFAAuthenticationCode(String clientId, String factor, String mfaToken) {
    this.clientId = clientId;
    this.factor = factor;
    this.mfaToken = mfaToken;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.clientId != null) {
      formDataParams.put("clientId", this.clientId);
    }
    if (this.factor != null) {
      formDataParams.put("factor", this.factor);
    }
    if (this.mfaToken != null) {
      formDataParams.put("mfaToken", this.mfaToken);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.clientId == null) {
      return false;
    }
    if (this.factor == null) {
      return false;
    }
    if (this.mfaToken == null) {
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

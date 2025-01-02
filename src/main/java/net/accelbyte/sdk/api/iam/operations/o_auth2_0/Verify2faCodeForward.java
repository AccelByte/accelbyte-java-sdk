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
 * Verify2FACodeForward
 *
 * <p>This is a forward version for '/mfa/verify'. If there is any error, it will redirect to login
 * website with error details. If success, it will forward to auth request redirect url If got
 * error, it will forward to login website Verify 2FA code This endpoint is used for verifying 2FA
 * code. ## 2FA remember device To remember device for 2FA, should provide cookie: device_token or
 * header: Device-Token
 */
@Getter
@Setter
public class Verify2faCodeForward extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/oauth/mfa/verify/forward";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String defaultFactor;

  private String factors;
  private Boolean rememberDevice;
  private String clientId;
  private String code;
  private String factor;
  private String mfaToken;

  /**
   * @param clientId required
   * @param code required
   * @param factor required
   * @param mfaToken required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public Verify2faCodeForward(
      String defaultFactor,
      String factors,
      Boolean rememberDevice,
      String clientId,
      String code,
      String factor,
      String mfaToken) {
    this.defaultFactor = defaultFactor;
    this.factors = factors;
    this.rememberDevice = rememberDevice;
    this.clientId = clientId;
    this.code = code;
    this.factor = factor;
    this.mfaToken = mfaToken;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.defaultFactor != null) {
      formDataParams.put("defaultFactor", this.defaultFactor);
    }
    if (this.factors != null) {
      formDataParams.put("factors", this.factors);
    }
    if (this.rememberDevice != null) {
      formDataParams.put(
          "rememberDevice",
          this.rememberDevice == null ? null : String.valueOf(this.rememberDevice));
    }
    if (this.clientId != null) {
      formDataParams.put("clientId", this.clientId);
    }
    if (this.code != null) {
      formDataParams.put("code", this.code);
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
    if (this.code == null) {
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

  public String parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final String json = Helper.convertInputStreamToString(payload);
    if (code != 302) {
      throw new HttpResponseException(code, json);
    }
    return json;
  }
}

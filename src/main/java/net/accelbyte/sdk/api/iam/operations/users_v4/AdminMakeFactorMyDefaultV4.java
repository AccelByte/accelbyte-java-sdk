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
 * AdminMakeFactorMyDefaultV4
 *
 * <p>This endpoint is used to make 2FA factor default.
 *
 * <p>This endpoint Requires valid user access token
 */
@Getter
@Setter
public class AdminMakeFactorMyDefaultV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/admin/users/me/mfa/factor";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String factor;

  /**
   * @param factor required
   */
  @Builder
  public AdminMakeFactorMyDefaultV4(String factor) {
    this.factor = factor;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.factor != null) {
      formDataParams.put("factor", this.factor);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.factor == null) {
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

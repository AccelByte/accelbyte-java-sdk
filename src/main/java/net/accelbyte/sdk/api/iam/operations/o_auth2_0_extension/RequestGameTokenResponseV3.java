/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension;

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
 * RequestGameTokenResponseV3
 *
 * <p>This endpoint is being used to generate publisher user's game token.
 *
 * <p>It require basic header with ClientID and Secret, it should match the ClientID when call
 * /iam/v3/namespace/{namespace}/token/request
 *
 * <p>It required a code which can be generated from /iam/v3/namespace/{namespace}/token/request.
 */
@Getter
@Setter
public class RequestGameTokenResponseV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/token/exchange";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String additionalData;

  private String code;

  /**
   * @param code required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RequestGameTokenResponseV3(String additionalData, String code) {
    this.additionalData = additionalData;
    this.code = code;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.additionalData != null) {
      formDataParams.put("additionalData", this.additionalData);
    }
    if (this.code != null) {
      formDataParams.put("code", this.code);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.code == null) {
      return false;
    }
    return true;
  }

  public OauthmodelTokenResponseV3 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthmodelTokenResponseV3().createFromJson(json);
  }
}

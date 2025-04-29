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
 * PublicForgotPasswordWithoutNamespaceV3
 *
 * <p>This endpoint does not need a namespace in the path, we will find the namespace based on:
 *
 * <p>- If this is premium environment, the namespace will be the publisher namespace. - If this is
 * shared cloud: - If this is from Admin Portal, we will find the user by the email. - If this is
 * not from Admin Portal, we will find the namespace based on the client id.
 *
 * <p>**Note**: - The param **clientId** is required in Shared Cloud - The namespace in the response
 * is publisher/studio namespace
 */
@Getter
@Setter
public class PublicForgotPasswordWithoutNamespaceV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/users/forgot";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private ModelForgotPasswordWithoutNamespaceRequestV3 body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicForgotPasswordWithoutNamespaceV3(ModelForgotPasswordWithoutNamespaceRequestV3 body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public ModelForgotPasswordWithoutNamespaceRequestV3 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ModelForgotPasswordResponseV3 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelForgotPasswordResponseV3().createFromJson(json);
  }
}

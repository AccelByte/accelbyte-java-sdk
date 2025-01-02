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
 * PublicUpgradeHeadlessWithCodeV4Forward
 *
 * <p>This is a forward version for code verify. The endpoint upgrades a headless account by linking
 * the headless account with the email address, username, and password. By upgrading the headless
 * account into a full account, the user could use the email address, username, and password for
 * using Justice IAM.
 *
 * <p>The endpoint is a shortcut for upgrading a headless account and verifying the email address in
 * one call. In order to get a verification code for the endpoint, please check the [send
 * verification code endpoint](#operations-Users-PublicSendCodeForwardV3).
 *
 * <p>This endpoint also have an ability to update user data (if the user data field is specified)
 * right after the upgrade account process is done.
 */
@Getter
@Setter
public class PublicUpgradeHeadlessWithCodeV4Forward extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/public/users/me/headless/code/verify/forward";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4 body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicUpgradeHeadlessWithCodeV4Forward(
      AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4 body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4 getBodyParams() {
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

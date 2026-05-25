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
 * PublicUpgradeHeadlessAccountWithVerificationCodeV4
 *
 * <p>Upgrades a headless account by linking it with an email address, username, and password, and
 * immediately verifies the email address afterward.
 *
 * <p>By upgrading the headless account into a full account, the user could use the email address,
 * username, and password for using Justice IAM.
 *
 * <p>To obtain a verification code, use the [send verification code
 * API](#operations-Users-PublicSendVerificationCodeV3).
 *
 * <p>Also has the ability to update user data (displayName, dateOfBirth, country) right after the
 * upgrade process is done. See request body field descriptions for format details.
 */
@Getter
@Setter
public class PublicUpgradeHeadlessAccountWithVerificationCodeV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/public/namespaces/{namespace}/users/me/headless/code/verify";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4 body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicUpgradeHeadlessAccountWithVerificationCodeV4(
      String namespace, AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4 body) {
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public AccountUserResponseV4 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new AccountUserResponseV4().createFromJson(json);
  }
}

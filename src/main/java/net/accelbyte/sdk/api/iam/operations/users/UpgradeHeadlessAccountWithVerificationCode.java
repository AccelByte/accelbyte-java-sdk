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
 * UpgradeHeadlessAccountWithVerificationCode
 *
 * <p>**This endpoint is deprecated.** ### Endpoint migration guide - **Substitute endpoint:
 * _/iam/v3/public/namespaces/{namespace}/users/me/headless/code/verify [POST]_**
 *
 * <p>Upgrades a headless account by linking it with an email address, username, and password, and
 * immediately verifies the email address afterward.
 *
 * <p>By upgrading the headless account into a full account, the user could use the email address
 * and password for using Justice IAM.
 *
 * <p>In order to get a verification code, please check the send verification code API.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class UpgradeHeadlessAccountWithVerificationCode extends Operation {
  /** generated field's value */
  private String path =
      "/iam/namespaces/{namespace}/users/{userId}/upgradeHeadlessAccountWithVerificationCode";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private ModelUpgradeHeadlessAccountWithVerificationCodeRequest body;

  /**
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpgradeHeadlessAccountWithVerificationCode(
      String namespace,
      String userId,
      ModelUpgradeHeadlessAccountWithVerificationCodeRequest body) {
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public ModelUpgradeHeadlessAccountWithVerificationCodeRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ModelUserResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelUserResponse().createFromJson(json);
  }
}

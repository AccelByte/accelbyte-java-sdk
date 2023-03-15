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
 * PublicVerifyHeadlessAccountV3
 *
 * <p>Require valid user authorization action code : 10124
 *
 * <p>if set NeedVerificationCode = true, IAM will send verification code into email
 *
 * <p>user can use that verification code to verify user through
 * /iam/v3/public/namespaces/{namespace}/users/me/code/verify
 */
@Getter
@Setter
public class PublicVerifyHeadlessAccountV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/namespaces/{namespace}/users/me/headless/verify";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private Boolean needVerificationCode;
  private ModelUpgradeHeadlessAccountV3Request body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicVerifyHeadlessAccountV3(
      String namespace, Boolean needVerificationCode, ModelUpgradeHeadlessAccountV3Request body) {
    this.namespace = namespace;
    this.needVerificationCode = needVerificationCode;
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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "needVerificationCode",
        this.needVerificationCode == null
            ? null
            : Arrays.asList(String.valueOf(this.needVerificationCode)));
    return queryParams;
  }

  @Override
  public ModelUpgradeHeadlessAccountV3Request getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelUserResponseV3 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelUserResponseV3().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("needVerificationCode", "None");
    return result;
  }
}

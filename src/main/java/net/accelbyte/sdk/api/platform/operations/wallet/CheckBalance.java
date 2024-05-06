/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.wallet;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * checkBalance
 *
 * <p>Checks if the user has enough balance based on the provided criteria. Other detail info:
 *
 * <p>* Returns : boolean value indicating if the user has enough balance
 */
@Getter
@Setter
public class CheckBalance extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{currencyCode}/balanceCheck";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String currencyCode;

  private String namespace;
  private String userId;
  private DebitByWalletPlatformRequest request;

  /**
   * @param currencyCode required
   * @param namespace required
   * @param userId required
   * @param request required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CheckBalance(
      String currencyCode, String namespace, String userId, DebitByWalletPlatformRequest request) {
    this.currencyCode = currencyCode;
    this.namespace = namespace;
    this.userId = userId;
    this.request = request;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.currencyCode != null) {
      pathParams.put("currencyCode", this.currencyCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public DebitByWalletPlatformRequest getBodyParams() {
    return this.request;
  }

  @Override
  public boolean isValid() {
    if (this.currencyCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

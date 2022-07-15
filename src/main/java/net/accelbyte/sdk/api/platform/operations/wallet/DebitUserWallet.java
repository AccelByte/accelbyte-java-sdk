/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.wallet;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.DebitRequest;
import net.accelbyte.sdk.api.platform.models.WalletInfo;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * debitUserWallet
 *
 * <p>Debit a user wallet. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:WALLET", action=4
 * (UPDATE)
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class DebitUserWallet extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{walletId}/debit";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String walletId;
  private DebitRequest body;

  /**
   * @param namespace required
   * @param userId required
   * @param walletId required
   */
  @Builder
  public DebitUserWallet(String namespace, String userId, String walletId, DebitRequest body) {
    this.namespace = namespace;
    this.userId = userId;
    this.walletId = walletId;
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
    if (this.walletId != null) {
      pathParams.put("walletId", this.walletId);
    }
    return pathParams;
  }

  @Override
  public DebitRequest getBodyParams() {
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
    if (this.walletId == null) {
      return false;
    }
    return true;
  }

  public WalletInfo parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new WalletInfo().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}

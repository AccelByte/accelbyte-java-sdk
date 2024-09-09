/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_config;

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
 * updatePaymentDomainWhitelistConfig
 *
 * <p>[Not supported yet in AGS Shared Cloud] Update payment provider config by namespace.
 *
 * <p>Request Body Parameters:
 *
 * <p>Parameter | Type | Required | Description
 * -----------|--------|----------|-------------------------------------------------- domains |
 * String | Yes | list of domains to whitelist for the return URL.
 *
 * <p>Other detail info:
 *
 * <p>* Validation : the domain should include the protocol (http/https), but the whitelist check
 * will only compare the host part (www.example.com) * Returns : payment domain whitelist config
 */
@Getter
@Setter
public class UpdatePaymentDomainWhitelistConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/payment/config/domains";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private PaymentDomainWhitelistConfigEdit body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdatePaymentDomainWhitelistConfig(
      String namespace, PaymentDomainWhitelistConfigEdit body) {
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
  public PaymentDomainWhitelistConfigEdit getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public PaymentDomainWhitelistConfigInfo parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentDomainWhitelistConfigInfo().createFromJson(json);
  }
}

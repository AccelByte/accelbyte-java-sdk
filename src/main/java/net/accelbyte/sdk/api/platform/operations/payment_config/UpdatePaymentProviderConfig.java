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
 * updatePaymentProviderConfig
 *
 * <p>Update payment provider config.
 *
 * <p>Request Body Parameters:
 *
 * <p>Parameter | Type | Required | Description
 * -----------|--------|----------|-----------------------------------------------------------
 * namespace | String | Yes | namespace, * indicates all namespace region | String | Yes | region, *
 * indicates all regions aggregate | String | No | aggregate payment provider, such as XSOLLA,
 * ADYEN, STRIPE specials | List | No | special payment provider, such as ALIPAY, WXPAY
 *
 * <p>payment provider applied has priority:
 *
 * <p>1. namespace and region match 2. namespace matches and region is * 3. region matches and
 * namespace is * 4. namespace and region are *
 *
 * <p>Other detail info: * Required permission : resource="ADMIN:PAYMENT:CONFIG", action=4 (UPDATE)
 * * Returns : payment provider config
 */
@Getter
@Setter
public class UpdatePaymentProviderConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/provider/{id}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String id;

  private PaymentProviderConfigEdit body;

  /**
   * @param id required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdatePaymentProviderConfig(String id, PaymentProviderConfigEdit body) {
    this.id = id;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.id != null) {
      pathParams.put("id", this.id);
    }
    return pathParams;
  }

  @Override
  public PaymentProviderConfigEdit getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.id == null) {
      return false;
    }
    return true;
  }

  public PaymentProviderConfigInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentProviderConfigInfo().createFromJson(json);
  }
}

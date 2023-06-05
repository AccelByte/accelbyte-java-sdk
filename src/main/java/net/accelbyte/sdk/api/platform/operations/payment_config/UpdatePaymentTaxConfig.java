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
 * updatePaymentTaxConfig
 *
 * <p>Update payment tax config.
 *
 * <p>Request Body Parameters:
 *
 * <p>Parameter | Type | Required | Description
 * --------------------------|---------|----------|---------------------------------------------------------------------
 * taxJarEnabled | Boolean | false taxJarApiToken | String | false | required, when taxJarEnabled is
 * true and there is no existing token sandboxTaxJarApiToken | String | false | optional
 * taxJarProductCodesMapping | Map | No | key is item type(APP |COINS |INGAMEITEM |BUNDLE |CODE
 * |SUBSCRIPTION) and value is product tax code:
 * https://developers.taxjar.com/api/reference/?ruby#get-list-tax-categories
 *
 * <p>Other detail info: * Required permission : resource="ADMIN:PAYMENT:CONFIG", action=4 (UPDATE)
 * * Returns : payment global tax config
 */
@Getter
@Setter
public class UpdatePaymentTaxConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/tax";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private PaymentTaxConfigEdit body;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdatePaymentTaxConfig(PaymentTaxConfigEdit body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public PaymentTaxConfigEdit getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public PaymentTaxConfigInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentTaxConfigInfo().createFromJson(json);
  }
}

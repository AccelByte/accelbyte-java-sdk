/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_config;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.PaymentTaxConfigInfo;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getPaymentTaxConfig
 *
 * <p>Get payment global tax config. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:PAYMENT:CONFIG", action=2 (READ) * Returns : payment
 * provider list
 */
@Getter
@Setter
public class GetPaymentTaxConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/tax";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */

  /** */
  @Builder
  public GetPaymentTaxConfig() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public PaymentTaxConfigInfo parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new PaymentTaxConfigInfo().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}

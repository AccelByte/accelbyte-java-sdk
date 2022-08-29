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
 * getPaymentMerchantConfig
 *
 * <p>Get payment merchant config by id. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:PAYMENT:CONFIG", action=2 (READ) * Returns : payment
 * merchant config info
 */
@Getter
@Setter
public class GetPaymentMerchantConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/merchant/{id}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String id;

  /**
   * @param id required
   */
  @Builder
  /*
   *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
   */
  @Deprecated
  public GetPaymentMerchantConfig(String id) {
    this.id = id;

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
  public boolean isValid() {
    if (this.id == null) {
      return false;
    }
    return true;
  }

  public PaymentMerchantConfigInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new PaymentMerchantConfigInfo().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}

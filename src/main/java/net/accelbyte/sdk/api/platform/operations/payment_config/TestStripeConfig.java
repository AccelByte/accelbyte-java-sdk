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
 * testStripeConfig
 *
 * <p>Test stripe configuration.
 *
 * <p>#### Check List:
 *
 * <p>* secretKey * allowedPaymentMethodTypes
 *
 * <p>#### Non-check list:
 *
 * <p>* publishableKey * webhookSecret
 *
 * <p>Other detail info: * Required permission : resource="ADMIN:PAYMENT:CONFIG", action=4 (UPDATE)
 * * Returns : test adyen config
 */
@Getter
@Setter
public class TestStripeConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/merchant/stripeconfig/test";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private Boolean sandbox;

  private StripeConfig body;

  /** */
  @Builder
  /*
   *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
   */
  @Deprecated
  public TestStripeConfig(Boolean sandbox, StripeConfig body) {
    this.sandbox = sandbox;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "sandbox", this.sandbox == null ? null : Arrays.asList(String.valueOf(this.sandbox)));
    return queryParams;
  }

  @Override
  public StripeConfig getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public TestResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new TestResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("sandbox", "None");
    return result;
  }
}

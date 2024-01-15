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
 * testWxPayConfig
 *
 * <p>[Not Supported Yet In Starter] Test WxPay configuration. Reference: [WxPay
 * Document](https://pay.weixin.qq.com/wiki/doc/api/native.php?chapter=9_1). Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:PAYMENT:CONFIG", action=4 (UPDATE) * Returns : test
 * WxPay config
 */
@Getter
@Setter
public class TestWxPayConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/merchant/wxpayconfig/test";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private WxPayConfigRequest body;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public TestWxPayConfig(WxPayConfigRequest body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public WxPayConfigRequest getBodyParams() {
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
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getAggregatePaymentProviders
 *
 * <p>Get aggregate payment providers, such as XSOLLA, ADYEN. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:PAYMENT:CONFIG", action=2 (READ) * Returns : payment
 * provider list
 */
@Getter
@Setter
public class GetAggregatePaymentProviders extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/provider/aggregate";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */

  /** */
  @Builder
  /*
   *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
   */
  @Deprecated
  public GetAggregatePaymentProviders() {

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public List<String> parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ObjectMapper().readValue(json, new TypeReference<List<String>>() {});
    }
    throw new HttpResponseException(code, json);
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_station;

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
 * publicCheckPaymentOrderPaidStatus
 *
 * <p>Check payment order paid status. Other detail info:
 *
 * <p>* Returns : Payment order paid result
 */
@Getter
@Setter
public class PublicCheckPaymentOrderPaidStatus extends Operation {
  /** generated field's value */
  private String path =
      "/platform/public/namespaces/{namespace}/payment/orders/{paymentOrderNo}/status";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String paymentOrderNo;

  /**
   * @param namespace required
   * @param paymentOrderNo required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicCheckPaymentOrderPaidStatus(String namespace, String paymentOrderNo) {
    this.namespace = namespace;
    this.paymentOrderNo = paymentOrderNo;
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.paymentOrderNo != null) {
      pathParams.put("paymentOrderNo", this.paymentOrderNo);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.paymentOrderNo == null) {
      return false;
    }
    return true;
  }

  public PaymentOrderPaidResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentOrderPaidResult().createFromJson(json);
  }
}

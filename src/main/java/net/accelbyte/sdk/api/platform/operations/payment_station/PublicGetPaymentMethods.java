/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_station;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * publicGetPaymentMethods
 *
 * <p>Get payment methods. Other detail info:
 *
 * <p>* Returns : Payment method list
 */
@Getter
@Setter
public class PublicGetPaymentMethods extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/payment/methods";

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
  public PublicGetPaymentMethods(String namespace, String paymentOrderNo) {
    this.namespace = namespace;
    this.paymentOrderNo = paymentOrderNo;
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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "paymentOrderNo", this.paymentOrderNo == null ? null : Arrays.asList(this.paymentOrderNo));
    return queryParams;
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

  public List<PaymentMethod> parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<List<PaymentMethod>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("paymentOrderNo", "None");
    return result;
  }
}

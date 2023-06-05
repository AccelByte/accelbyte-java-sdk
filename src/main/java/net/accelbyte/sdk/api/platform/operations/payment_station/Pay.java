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
 * pay
 *
 * <p>Do payment(For now, this only support checkout.com). Other detail info:
 *
 * <p>* Returns : Payment process result
 */
@Getter
@Setter
public class Pay extends Operation {
  /** generated field's value */
  private String path =
      "/platform/public/namespaces/{namespace}/payment/orders/{paymentOrderNo}/pay";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String paymentOrderNo;
  private String paymentProvider;
  private String zipCode;
  private PaymentToken body;

  /**
   * @param namespace required
   * @param paymentOrderNo required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public Pay(
      String namespace,
      String paymentOrderNo,
      String paymentProvider,
      String zipCode,
      PaymentToken body) {
    this.namespace = namespace;
    this.paymentOrderNo = paymentOrderNo;
    this.paymentProvider = paymentProvider;
    this.zipCode = zipCode;
    this.body = body;
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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "paymentProvider",
        this.paymentProvider == null ? null : Arrays.asList(this.paymentProvider));
    queryParams.put("zipCode", this.zipCode == null ? null : Arrays.asList(this.zipCode));
    return queryParams;
  }

  @Override
  public PaymentToken getBodyParams() {
    return this.body;
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

  public PaymentProcessResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentProcessResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("paymentProvider", "None");
    result.put("zipCode", "None");
    return result;
  }

  public enum PaymentProvider {
    ADYEN("ADYEN"),
    ALIPAY("ALIPAY"),
    CHECKOUT("CHECKOUT"),
    PAYPAL("PAYPAL"),
    STRIPE("STRIPE"),
    WALLET("WALLET"),
    WXPAY("WXPAY"),
    XSOLLA("XSOLLA");

    private String value;

    PaymentProvider(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PayBuilder {
    private String paymentProvider;

    public PayBuilder paymentProvider(final String paymentProvider) {
      this.paymentProvider = paymentProvider;
      return this;
    }

    public PayBuilder paymentProviderFromEnum(final PaymentProvider paymentProvider) {
      this.paymentProvider = paymentProvider.toString();
      return this;
    }
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.iap;

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
 * adminRefundIAPOrder
 *
 * <p>Only support steam transaction mode
 */
@Getter
@Setter
public class AdminRefundIAPOrder extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/iap/steam/orders/{iapOrderNo}/refund";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String iapOrderNo;

  private String namespace;

  /**
   * @param iapOrderNo required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminRefundIAPOrder(String iapOrderNo, String namespace) {
    this.iapOrderNo = iapOrderNo;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.iapOrderNo != null) {
      pathParams.put("iapOrderNo", this.iapOrderNo);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.iapOrderNo == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public IAPOrderInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new IAPOrderInfo().createFromJson(json);
  }
}

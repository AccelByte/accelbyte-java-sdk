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
 * updateXsollaUIConfig
 *
 * <p>Update xsolla UI configuration.Reference: [Xsolla
 * Document](https://developers.xsolla.com/api.html#ui-integrations). Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:PAYMENT:CONFIG", action=4 (UPDATE) * Returns : updated
 * payment merchant config
 */
@Getter
@Setter
public class UpdateXsollaUIConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/merchant/{id}/xsollauiconfig";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String id;

  private XsollaPaywallConfigRequest body;

  /**
   * @param id required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateXsollaUIConfig(String id, XsollaPaywallConfigRequest body) {
    this.id = id;
    this.body = body;

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
  public XsollaPaywallConfigRequest getBodyParams() {
    return this.body;
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
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentMerchantConfigInfo().createFromJson(json);
  }
}

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
 * updateNeonPayConfig
 *
 * <p>[Not supported yet in AGS Shared Cloud] Update Neon Pay config. Other detail info:
 *
 * <p>* Returns : updated payment merchant config
 */
@Getter
@Setter
public class UpdateNeonPayConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/merchant/{id}/neonpayconfig";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String id;

  private Boolean sandbox;
  private Boolean validate;
  private NeonPayConfig body;

  /**
   * @param id required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateNeonPayConfig(String id, Boolean sandbox, Boolean validate, NeonPayConfig body) {
    this.id = id;
    this.sandbox = sandbox;
    this.validate = validate;
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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "sandbox", this.sandbox == null ? null : Arrays.asList(String.valueOf(this.sandbox)));
    queryParams.put(
        "validate", this.validate == null ? null : Arrays.asList(String.valueOf(this.validate)));
    return queryParams;
  }

  @Override
  public NeonPayConfig getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.id == null) {
      return false;
    }
    if (this.body == null) {
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

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("sandbox", "None");
    result.put("validate", "None");
    return result;
  }
}

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
 * testStripeConfigById
 *
 * <p>Test stripe configuration in payment merchant config. Other detail info: * Required permission
 * : resource="ADMIN:PAYMENT:CONFIG", action=2 (READ) * Returns : test adyen config
 */
@Getter
@Setter
public class TestStripeConfigById extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/merchant/{id}/stripeconfig/test";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String id;

  private Boolean sandbox;

  /**
   * @param id required
   */
  @Builder
  public TestStripeConfigById(String id, Boolean sandbox) {
    this.id = id;
    this.sandbox = sandbox;

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
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.id == null) {
      return false;
    }
    return true;
  }

  public TestResult parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new TestResult().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("sandbox", "None");
    return result;
  }
}

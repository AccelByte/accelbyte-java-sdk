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
 * queryPaymentProviderConfig
 *
 * <p>[Not Supported Yet In Starter] Query payment provider config. Other detail info:
 *
 * <p>* Returns : payment provider config list
 */
@Getter
@Setter
public class QueryPaymentProviderConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/provider";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private Integer limit;

  private String namespace;
  private Integer offset;
  private String region;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryPaymentProviderConfig(
      Integer limit, String namespace, Integer offset, String region) {
    this.limit = limit;
    this.namespace = namespace;
    this.offset = offset;
    this.region = region;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("namespace", this.namespace == null ? null : Arrays.asList(this.namespace));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public PaymentProviderConfigPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentProviderConfigPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("namespace", "None");
    result.put("offset", "None");
    result.put("region", "None");
    return result;
  }
}

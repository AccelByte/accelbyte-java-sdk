/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.fulfillment;

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
 * fulfillItemsV3
 *
 * <p>[Not supported yet in AGS Shared Cloud] Fulfill items by transactionId. Other detail info: *
 * Request body : storeId, region, language, and entitlementCollectionId can be ignored. * Returns :
 * fulfillment v2 result, storeId field can be ignored.
 */
@Getter
@Setter
public class FulfillItemsV3 extends Operation {
  /** generated field's value */
  private String path =
      "/platform/v3/admin/namespaces/{namespace}/users/{userId}/fulfillments/{transactionId}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String transactionId;
  private String userId;
  private FulfillmentV2Request body;

  /**
   * @param namespace required
   * @param transactionId required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public FulfillItemsV3(
      String namespace, String transactionId, String userId, FulfillmentV2Request body) {
    this.namespace = namespace;
    this.transactionId = transactionId;
    this.userId = userId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.transactionId != null) {
      pathParams.put("transactionId", this.transactionId);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public FulfillmentV2Request getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.transactionId == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public FulfillmentV2Result parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new FulfillmentV2Result().createFromJson(json);
  }
}

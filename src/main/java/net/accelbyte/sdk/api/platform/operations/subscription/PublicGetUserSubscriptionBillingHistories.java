/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.subscription;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.BillingHistoryPagingSlicedResult;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicGetUserSubscriptionBillingHistories
 *
 * <p>Get user subscription billing histories. Other detail info:
 *
 * <p>* Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:SUBSCRIPTION", action=2
 * (READ) * Returns : paginated subscription history
 */
@Getter
@Setter
public class PublicGetUserSubscriptionBillingHistories extends Operation {
  /** generated field's value */
  private String path =
      "/platform/public/namespaces/{namespace}/users/{userId}/subscriptions/{subscriptionId}/history";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String subscriptionId;
  private String userId;
  private Boolean excludeFree;
  private Integer limit;
  private Integer offset;

  /**
   * @param namespace required
   * @param subscriptionId required
   * @param userId required
   */
  @Builder
  public PublicGetUserSubscriptionBillingHistories(
      String namespace,
      String subscriptionId,
      String userId,
      Boolean excludeFree,
      Integer limit,
      Integer offset) {
    this.namespace = namespace;
    this.subscriptionId = subscriptionId;
    this.userId = userId;
    this.excludeFree = excludeFree;
    this.limit = limit;
    this.offset = offset;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.subscriptionId != null) {
      pathParams.put("subscriptionId", this.subscriptionId);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "excludeFree",
        this.excludeFree == null ? null : Arrays.asList(String.valueOf(this.excludeFree)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.subscriptionId == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public BillingHistoryPagingSlicedResult parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new BillingHistoryPagingSlicedResult().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("excludeFree", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    return result;
  }
}

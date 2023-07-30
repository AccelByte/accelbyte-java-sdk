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
 * queryUserIAPOrders
 *
 * <p>Query IAP orders. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:IAP", action=2
 * (READ) * Returns : paginated iap orders
 */
@Getter
@Setter
public class QueryUserIAPOrders extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/users/{userId}/iap";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String endTime;
  private Integer limit;
  private Integer offset;
  private String productId;
  private String startTime;
  private String status;
  private String type;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryUserIAPOrders(
      String namespace,
      String userId,
      String endTime,
      Integer limit,
      Integer offset,
      String productId,
      String startTime,
      String status,
      String type) {
    this.namespace = namespace;
    this.userId = userId;
    this.endTime = endTime;
    this.limit = limit;
    this.offset = offset;
    this.productId = productId;
    this.startTime = startTime;
    this.status = status;
    this.type = type;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("endTime", this.endTime == null ? null : Arrays.asList(this.endTime));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("productId", this.productId == null ? null : Arrays.asList(this.productId));
    queryParams.put("startTime", this.startTime == null ? null : Arrays.asList(this.startTime));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    queryParams.put("type", this.type == null ? null : Arrays.asList(this.type));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public IAPOrderPagingSlicedResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new IAPOrderPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endTime", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("productId", "None");
    result.put("startTime", "None");
    result.put("status", "None");
    result.put("type", "None");
    return result;
  }

  public enum Status {
    FAILED("FAILED"),
    FULFILLED("FULFILLED"),
    VERIFIED("VERIFIED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Type {
    APPLE("APPLE"),
    EPICGAMES("EPICGAMES"),
    GOOGLE("GOOGLE"),
    OCULUS("OCULUS"),
    PLAYSTATION("PLAYSTATION"),
    STADIA("STADIA"),
    STEAM("STEAM"),
    TWITCH("TWITCH"),
    XBOX("XBOX");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryUserIAPOrdersBuilder {
    private String status;
    private String type;

    public QueryUserIAPOrdersBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public QueryUserIAPOrdersBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public QueryUserIAPOrdersBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public QueryUserIAPOrdersBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}

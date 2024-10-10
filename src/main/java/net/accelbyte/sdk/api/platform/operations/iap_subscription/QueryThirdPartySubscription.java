/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.iap_subscription;

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
 * queryThirdPartySubscription
 *
 * <p>Query subscriptions, default sort by updatedAt Other detail info: * Returns :
 */
@Getter
@Setter
public class QueryThirdPartySubscription extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/iap/subscriptions";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean activeOnly;
  private String groupId;
  private Integer limit;
  private Integer offset;
  private String platform;
  private String productId;
  private String userId;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryThirdPartySubscription(
      String namespace,
      Boolean activeOnly,
      String groupId,
      Integer limit,
      Integer offset,
      String platform,
      String productId,
      String userId) {
    this.namespace = namespace;
    this.activeOnly = activeOnly;
    this.groupId = groupId;
    this.limit = limit;
    this.offset = offset;
    this.platform = platform;
    this.productId = productId;
    this.userId = userId;

    securities.add("Bearer");
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
        "activeOnly",
        this.activeOnly == null ? null : Arrays.asList(String.valueOf(this.activeOnly)));
    queryParams.put("groupId", this.groupId == null ? null : Arrays.asList(this.groupId));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("platform", this.platform == null ? null : Arrays.asList(this.platform));
    queryParams.put("productId", this.productId == null ? null : Arrays.asList(this.productId));
    queryParams.put("userId", this.userId == null ? null : Arrays.asList(this.userId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ThirdPartyUserSubscriptionPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ThirdPartyUserSubscriptionPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("activeOnly", "None");
    result.put("groupId", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("platform", "None");
    result.put("productId", "None");
    result.put("userId", "None");
    return result;
  }

  public enum Platform {
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

    Platform(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryThirdPartySubscriptionBuilder {
    private String platform;

    public QueryThirdPartySubscriptionBuilder platform(final String platform) {
      this.platform = platform;
      return this;
    }

    public QueryThirdPartySubscriptionBuilder platformFromEnum(final Platform platform) {
      this.platform = platform.toString();
      return this;
    }
  }
}

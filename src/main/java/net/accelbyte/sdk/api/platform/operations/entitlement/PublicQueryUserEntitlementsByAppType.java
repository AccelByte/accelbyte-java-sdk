/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

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
 * publicQueryUserEntitlementsByAppType
 *
 * <p>Query app entitlements by appType.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:ENTITLEMENT", action=2
 * (READ) * Returns : app entitlement pagination
 */
@Getter
@Setter
public class PublicQueryUserEntitlementsByAppType extends Operation {
  /** generated field's value */
  private String path =
      "/platform/public/namespaces/{namespace}/users/{userId}/entitlements/byAppType";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private Integer limit;
  private Integer offset;
  private String appType;

  /**
   * @param namespace required
   * @param userId required
   * @param appType required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicQueryUserEntitlementsByAppType(
      String namespace, String userId, Integer limit, Integer offset, String appType) {
    this.namespace = namespace;
    this.userId = userId;
    this.limit = limit;
    this.offset = offset;
    this.appType = appType;

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
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("appType", this.appType == null ? null : Arrays.asList(this.appType));
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
    if (this.appType == null) {
      return false;
    }
    return true;
  }

  public AppEntitlementPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new AppEntitlementPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("appType", "None");
    return result;
  }

  public enum AppType {
    DEMO("DEMO"),
    DLC("DLC"),
    GAME("GAME"),
    SOFTWARE("SOFTWARE");

    private String value;

    AppType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PublicQueryUserEntitlementsByAppTypeBuilder {
    private String appType;

    public PublicQueryUserEntitlementsByAppTypeBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public PublicQueryUserEntitlementsByAppTypeBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.EntitlementPagingSlicedResult;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicQueryUserEntitlements
 *
 * <p>Query user entitlements for a specific user.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:ENTITLEMENT", action=2
 * (READ) * Returns : entitlement list
 */
@Getter
@Setter
public class PublicQueryUserEntitlements extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/users/{userId}/entitlements";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String appType;
  private String entitlementClazz;
  private String entitlementName;
  private List<String> itemId;
  private Integer limit;
  private Integer offset;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  public PublicQueryUserEntitlements(
      String namespace,
      String userId,
      String appType,
      String entitlementClazz,
      String entitlementName,
      List<String> itemId,
      Integer limit,
      Integer offset) {
    this.namespace = namespace;
    this.userId = userId;
    this.appType = appType;
    this.entitlementClazz = entitlementClazz;
    this.entitlementName = entitlementName;
    this.itemId = itemId;
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
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("appType", this.appType == null ? null : Arrays.asList(this.appType));
    queryParams.put(
        "entitlementClazz",
        this.entitlementClazz == null ? null : Arrays.asList(this.entitlementClazz));
    queryParams.put(
        "entitlementName",
        this.entitlementName == null ? null : Arrays.asList(this.entitlementName));
    queryParams.put("itemId", this.itemId == null ? null : this.itemId);
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
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public EntitlementPagingSlicedResult parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new EntitlementPagingSlicedResult().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("appType", "None");
    result.put("entitlementClazz", "None");
    result.put("entitlementName", "None");
    result.put("itemId", "multi");
    result.put("limit", "None");
    result.put("offset", "None");
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

  public enum EntitlementClazz {
    APP("APP"),
    CODE("CODE"),
    ENTITLEMENT("ENTITLEMENT"),
    MEDIA("MEDIA"),
    SUBSCRIPTION("SUBSCRIPTION");

    private String value;

    EntitlementClazz(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PublicQueryUserEntitlementsBuilder {
    private String appType;
    private String entitlementClazz;

    public PublicQueryUserEntitlementsBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public PublicQueryUserEntitlementsBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public PublicQueryUserEntitlementsBuilder entitlementClazz(final String entitlementClazz) {
      this.entitlementClazz = entitlementClazz;
      return this;
    }

    public PublicQueryUserEntitlementsBuilder entitlementClazzFromEnum(
        final EntitlementClazz entitlementClazz) {
      this.entitlementClazz = entitlementClazz.toString();
      return this;
    }
  }
}

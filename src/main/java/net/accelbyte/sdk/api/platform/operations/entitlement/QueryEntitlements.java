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
 * queryEntitlements
 *
 * <p>Query entitlements.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:ENTITLEMENT", action=2 (READ) *
 * Returns : entitlement list
 */
@Getter
@Setter
public class QueryEntitlements extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/entitlements";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean activeOnly;
  private String appType;
  private String entitlementClazz;
  private String entitlementName;
  private List<String> itemId;
  private Integer limit;
  private Integer offset;
  private String origin;
  private String userId;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryEntitlements(
      String namespace,
      Boolean activeOnly,
      String appType,
      String entitlementClazz,
      String entitlementName,
      List<String> itemId,
      Integer limit,
      Integer offset,
      String origin,
      String userId) {
    this.namespace = namespace;
    this.activeOnly = activeOnly;
    this.appType = appType;
    this.entitlementClazz = entitlementClazz;
    this.entitlementName = entitlementName;
    this.itemId = itemId;
    this.limit = limit;
    this.offset = offset;
    this.origin = origin;
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
    queryParams.put("origin", this.origin == null ? null : Arrays.asList(this.origin));
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

  public EntitlementPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new EntitlementPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("activeOnly", "None");
    result.put("appType", "None");
    result.put("entitlementClazz", "None");
    result.put("entitlementName", "None");
    result.put("itemId", "multi");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("origin", "None");
    result.put("userId", "None");
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
    LOOTBOX("LOOTBOX"),
    MEDIA("MEDIA"),
    OPTIONBOX("OPTIONBOX"),
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

  public enum Origin {
    Epic("Epic"),
    GooglePlay("GooglePlay"),
    IOS("IOS"),
    Nintendo("Nintendo"),
    Oculus("Oculus"),
    Other("Other"),
    Playstation("Playstation"),
    Steam("Steam"),
    System("System"),
    Twitch("Twitch"),
    Xbox("Xbox");

    private String value;

    Origin(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryEntitlementsBuilder {
    private String appType;
    private String entitlementClazz;
    private String origin;

    public QueryEntitlementsBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public QueryEntitlementsBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public QueryEntitlementsBuilder entitlementClazz(final String entitlementClazz) {
      this.entitlementClazz = entitlementClazz;
      return this;
    }

    public QueryEntitlementsBuilder entitlementClazzFromEnum(
        final EntitlementClazz entitlementClazz) {
      this.entitlementClazz = entitlementClazz.toString();
      return this;
    }

    public QueryEntitlementsBuilder origin(final String origin) {
      this.origin = origin;
      return this;
    }

    public QueryEntitlementsBuilder originFromEnum(final Origin origin) {
      this.origin = origin.toString();
      return this;
    }
  }
}

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
 * queryUserEntitlements
 *
 * <p>Query entitlements for a specific user.
 *
 * <p>Other detail info:
 *
 * <p>* Returns : entitlement list
 */
@Getter
@Setter
public class QueryUserEntitlements extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/users/{userId}/entitlements";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private Boolean activeOnly;
  private String appType;
  private String collectionId;
  private String entitlementClazz;
  private String entitlementName;
  private List<String> features;
  private Boolean fuzzyMatchName;
  private Boolean ignoreActiveDate;
  private List<String> itemId;
  private Integer limit;
  private Integer offset;
  private String origin;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryUserEntitlements(
      String namespace,
      String userId,
      Boolean activeOnly,
      String appType,
      String collectionId,
      String entitlementClazz,
      String entitlementName,
      List<String> features,
      Boolean fuzzyMatchName,
      Boolean ignoreActiveDate,
      List<String> itemId,
      Integer limit,
      Integer offset,
      String origin) {
    this.namespace = namespace;
    this.userId = userId;
    this.activeOnly = activeOnly;
    this.appType = appType;
    this.collectionId = collectionId;
    this.entitlementClazz = entitlementClazz;
    this.entitlementName = entitlementName;
    this.features = features;
    this.fuzzyMatchName = fuzzyMatchName;
    this.ignoreActiveDate = ignoreActiveDate;
    this.itemId = itemId;
    this.limit = limit;
    this.offset = offset;
    this.origin = origin;

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
    queryParams.put(
        "activeOnly",
        this.activeOnly == null ? null : Arrays.asList(String.valueOf(this.activeOnly)));
    queryParams.put("appType", this.appType == null ? null : Arrays.asList(this.appType));
    queryParams.put(
        "collectionId", this.collectionId == null ? null : Arrays.asList(this.collectionId));
    queryParams.put(
        "entitlementClazz",
        this.entitlementClazz == null ? null : Arrays.asList(this.entitlementClazz));
    queryParams.put(
        "entitlementName",
        this.entitlementName == null ? null : Arrays.asList(this.entitlementName));
    queryParams.put(
        "features",
        this.features == null
            ? null
            : this.features.stream()
                .map(i -> String.valueOf(i))
                .collect(java.util.stream.Collectors.toList()));
    queryParams.put(
        "fuzzyMatchName",
        this.fuzzyMatchName == null ? null : Arrays.asList(String.valueOf(this.fuzzyMatchName)));
    queryParams.put(
        "ignoreActiveDate",
        this.ignoreActiveDate == null
            ? null
            : Arrays.asList(String.valueOf(this.ignoreActiveDate)));
    queryParams.put(
        "itemId",
        this.itemId == null
            ? null
            : this.itemId.stream()
                .map(i -> String.valueOf(i))
                .collect(java.util.stream.Collectors.toList()));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("origin", this.origin == null ? null : Arrays.asList(this.origin));
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
    result.put("collectionId", "None");
    result.put("entitlementClazz", "None");
    result.put("entitlementName", "None");
    result.put("features", "multi");
    result.put("fuzzyMatchName", "None");
    result.put("ignoreActiveDate", "None");
    result.put("itemId", "multi");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("origin", "None");
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

  public static class QueryUserEntitlementsBuilder {
    private String appType;
    private String entitlementClazz;
    private String origin;

    public QueryUserEntitlementsBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public QueryUserEntitlementsBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public QueryUserEntitlementsBuilder entitlementClazz(final String entitlementClazz) {
      this.entitlementClazz = entitlementClazz;
      return this;
    }

    public QueryUserEntitlementsBuilder entitlementClazzFromEnum(
        final EntitlementClazz entitlementClazz) {
      this.entitlementClazz = entitlementClazz.toString();
      return this;
    }

    public QueryUserEntitlementsBuilder origin(final String origin) {
      this.origin = origin;
      return this;
    }

    public QueryUserEntitlementsBuilder originFromEnum(final Origin origin) {
      this.origin = origin.toString();
      return this;
    }
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.item;

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
 * queryItemReferences
 *
 * <p>This API is used to get references for an item
 */
@Getter
@Setter
public class QueryItemReferences extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/items/{itemId}/references";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String itemId;

  private String namespace;
  private List<String> featuresToCheck;
  private String storeId;

  /**
   * @param itemId required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryItemReferences(
      String itemId, String namespace, List<String> featuresToCheck, String storeId) {
    this.itemId = itemId;
    this.namespace = namespace;
    this.featuresToCheck = featuresToCheck;
    this.storeId = storeId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.itemId != null) {
      pathParams.put("itemId", this.itemId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "featuresToCheck",
        this.featuresToCheck == null
            ? null
            : this.featuresToCheck.stream()
                .map(i -> String.valueOf(i))
                .collect(java.util.stream.Collectors.toList()));
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.itemId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ItemDependency parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ItemDependency().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("featuresToCheck", "multi");
    result.put("storeId", "None");
    return result;
  }

  public enum FeaturesToCheck {
    CAMPAIGN("CAMPAIGN"),
    CATALOG("CATALOG"),
    DLC("DLC"),
    ENTITLEMENT("ENTITLEMENT"),
    IAP("IAP"),
    REWARD("REWARD");

    private String value;

    FeaturesToCheck(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryItemReferencesBuilder {
    private List<String> featuresToCheck;

    public QueryItemReferencesBuilder featuresToCheck(final List<String> featuresToCheck) {
      this.featuresToCheck = featuresToCheck;
      return this;
    }

    public QueryItemReferencesBuilder featuresToCheckFromEnum(
        final List<FeaturesToCheck> featuresToCheck) {
      ArrayList<String> en = new ArrayList<String>();
      for (FeaturesToCheck e : featuresToCheck) en.add(e.toString());
      this.featuresToCheck = en;
      return this;
    }
  }
}

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
 * publicGetApp
 *
 * <p>This API is used to get an app in locale. If app not exist in specific region, default region
 * app will return.
 *
 * <p>Other detail info:
 *
 * <p>* Optional permission : resource="PREVIEW", action=1(CREATE) (user with this permission can
 * view draft store app) * Optional permission : resource="SANDBOX", action=1(CREATE) (user with
 * this permission can view draft store app) * Returns : app data
 */
@Getter
@Setter
public class PublicGetApp extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/items/{itemId}/app/locale";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String itemId;

  private String namespace;
  private String language;
  private String region;
  private String storeId;

  /**
   * @param itemId required
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetApp(
      String itemId, String namespace, String language, String region, String storeId) {
    this.itemId = itemId;
    this.namespace = namespace;
    this.language = language;
    this.region = region;
    this.storeId = storeId;
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
    queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
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

  public AppInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new AppInfo().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("language", "None");
    result.put("region", "None");
    result.put("storeId", "None");
    return result;
  }
}

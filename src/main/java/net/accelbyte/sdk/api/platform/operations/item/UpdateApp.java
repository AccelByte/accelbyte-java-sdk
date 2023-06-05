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
 * updateApp
 *
 * <p>This API is used to update an app.
 *
 * <p>An app update example:
 *
 * <p>{
 *
 * <p>"developer": "accelbyte",
 *
 * <p>"publisher": "accelbyte",
 *
 * <p>"websiteUrl": "http://accelbyte.io",
 *
 * <p>"forumUrl": "http://accelbyte.io",
 *
 * <p>"platforms": ["Windows(allowed values: Windows, MacOS, Linux, IOS, Android)"],
 *
 * <p>"platformRequirements": {
 *
 * <p>"Windows": [
 *
 * <p>{
 *
 * <p>"label":"minimum(can be minimum or recommended)",
 *
 * <p>"osVersion":"os version",
 *
 * <p>"processor":"processor",
 *
 * <p>"ram":"RAM",
 *
 * <p>"graphics":"graphics",
 *
 * <p>"directXVersion":"directXVersion",
 *
 * <p>"diskSpace":"diskSpace",
 *
 * <p>"soundCard":"soundCard",
 *
 * <p>"additionals":"additionals"
 *
 * <p>}
 *
 * <p>]
 *
 * <p>},
 *
 * <p>"carousel": [
 *
 * <p>{
 *
 * <p>"type":"image(allowed values: image, video)",
 *
 * <p>"videoSource":"generic(allowed values:generic, youtube, viemo)",
 *
 * <p>"url":"url",
 *
 * <p>"alt":"alternative url or text",
 *
 * <p>"thumbnailUrl":"thumbnail url",
 *
 * <p>"previewUrl":"preview url",
 *
 * <p>}
 *
 * <p>],
 *
 * <p>"localizations": {
 *
 * <p>"en": {
 *
 * <p>"slogan":"slogan",
 *
 * <p>"announcement":"announcement",
 *
 * <p>}
 *
 * <p>},
 *
 * <p>"primaryGenre": "Action",
 *
 * <p>"genres": ["Action", "Adventure"],
 *
 * <p>"players": ["Single"],
 *
 * <p>"releaseDate": "optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
 *
 * <p>}
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:ITEM", action=4 (UPDATE) *
 * Returns : updated app data
 */
@Getter
@Setter
public class UpdateApp extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/items/{itemId}/app";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String itemId;

  private String namespace;
  private String storeId;
  private AppUpdate body;

  /**
   * @param itemId required
   * @param namespace required
   * @param storeId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateApp(String itemId, String namespace, String storeId, AppUpdate body) {
    this.itemId = itemId;
    this.namespace = namespace;
    this.storeId = storeId;
    this.body = body;

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
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    return queryParams;
  }

  @Override
  public AppUpdate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.itemId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.storeId == null) {
      return false;
    }
    return true;
  }

  public FullAppInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new FullAppInfo().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("storeId", "None");
    return result;
  }
}

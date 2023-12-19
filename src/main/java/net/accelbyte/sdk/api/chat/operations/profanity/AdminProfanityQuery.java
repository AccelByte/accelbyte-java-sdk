/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.operations.profanity;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminProfanityQuery
 *
 * <p>Query all profanity words.
 */
@Getter
@Setter
public class AdminProfanityQuery extends Operation {
  /** generated field's value */
  private String path = "/chat/v1/admin/profanity/namespaces/{namespace}/dictionary";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String filterMask;
  private Boolean includeChildren;
  private Integer limit;
  private Integer offset;
  private String parentId;
  private String startWith;
  private String wordType;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminProfanityQuery(
      String namespace,
      String filterMask,
      Boolean includeChildren,
      Integer limit,
      Integer offset,
      String parentId,
      String startWith,
      String wordType) {
    this.namespace = namespace;
    this.filterMask = filterMask;
    this.includeChildren = includeChildren;
    this.limit = limit;
    this.offset = offset;
    this.parentId = parentId;
    this.startWith = startWith;
    this.wordType = wordType;

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
    queryParams.put("filterMask", this.filterMask == null ? null : Arrays.asList(this.filterMask));
    queryParams.put(
        "includeChildren",
        this.includeChildren == null ? null : Arrays.asList(String.valueOf(this.includeChildren)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("parentId", this.parentId == null ? null : Arrays.asList(this.parentId));
    queryParams.put("startWith", this.startWith == null ? null : Arrays.asList(this.startWith));
    queryParams.put("wordType", this.wordType == null ? null : Arrays.asList(this.wordType));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsDictionaryQueryResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsDictionaryQueryResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("filterMask", "None");
    result.put("includeChildren", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("parentId", "None");
    result.put("startWith", "None");
    result.put("wordType", "None");
    return result;
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.admin;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getSlugTemplate
 *
 * <p>Required permission : `NAMESPACE:{namespace}:TEMPLATE [READ]` with scope `social`
 *
 * <p>Get all templates in a namespace
 */
@Getter
@Setter
public class GetSlugTemplate extends Operation {
  /** generated field's value */
  private String path = "/notification/namespaces/{namespace}/templates/{templateSlug}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String templateSlug;
  private String after;
  private String before;
  private Integer limit;

  /**
   * @param namespace required
   * @param templateSlug required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetSlugTemplate(
      String namespace, String templateSlug, String after, String before, Integer limit) {
    this.namespace = namespace;
    this.templateSlug = templateSlug;
    this.after = after;
    this.before = before;
    this.limit = limit;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.templateSlug != null) {
      pathParams.put("templateSlug", this.templateSlug);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("after", this.after == null ? null : Arrays.asList(this.after));
    queryParams.put("before", this.before == null ? null : Arrays.asList(this.before));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.templateSlug == null) {
      return false;
    }
    return true;
  }

  public ModelTemplateLocalizationResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelTemplateLocalizationResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("after", "None");
    result.put("before", "None");
    result.put("limit", "None");
    return result;
  }
}

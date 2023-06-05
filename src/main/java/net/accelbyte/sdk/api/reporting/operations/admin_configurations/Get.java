/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.operations.admin_configurations;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.reporting.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * Get
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:REPORTINGCONFIG [READ] TimeInterval is in
 * nanoseconds. When there's no configuration set, the response is the default value (configurable
 * through envar).
 */
@Getter
@Setter
public class Get extends Operation {
  /** generated field's value */
  private String path = "/reporting/v1/admin/namespaces/{namespace}/configurations";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String category;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public Get(String namespace, String category) {
    this.namespace = namespace;
    this.category = category;

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
    queryParams.put("category", this.category == null ? null : Arrays.asList(this.category));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public RestapiConfigResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new RestapiConfigResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("category", "None");
    return result;
  }

  public enum Category {
    All("all"),
    Extension("extension");

    private String value;

    Category(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GetBuilder {
    private String category;

    public GetBuilder category(final String category) {
      this.category = category;
      return this;
    }

    public GetBuilder categoryFromEnum(final Category category) {
      this.category = category.toString();
      return this;
    }
  }
}

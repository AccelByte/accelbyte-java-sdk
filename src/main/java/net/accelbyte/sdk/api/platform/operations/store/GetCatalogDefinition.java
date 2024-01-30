/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.store;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * getCatalogDefinition
 *
 * <p>This API is used to get catalog definition for import/export store by CSV
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource=ADMIN:NAMESPACE:{namespace}:STORE, action=2 (READ) * Returns
 * : catalog definition
 */
@Getter
@Setter
public class GetCatalogDefinition extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/stores/catalogDefinition";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String catalogType;

  /**
   * @param namespace required
   * @param catalogType required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetCatalogDefinition(String namespace, String catalogType) {
    this.namespace = namespace;
    this.catalogType = catalogType;

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
        "catalogType", this.catalogType == null ? null : Arrays.asList(this.catalogType));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.catalogType == null) {
      return false;
    }
    return true;
  }

  public List<CatalogDefinitionInfo> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<List<CatalogDefinitionInfo>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("catalogType", "None");
    return result;
  }

  public enum CatalogType {
    APP("APP"),
    CATEGORY("CATEGORY"),
    ITEM("ITEM"),
    SECTION("SECTION"),
    VIEW("VIEW");

    private String value;

    CatalogType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GetCatalogDefinitionBuilder {
    private String catalogType;

    public GetCatalogDefinitionBuilder catalogType(final String catalogType) {
      this.catalogType = catalogType;
      return this;
    }

    public GetCatalogDefinitionBuilder catalogTypeFromEnum(final CatalogType catalogType) {
      this.catalogType = catalogType.toString();
      return this;
    }
  }
}

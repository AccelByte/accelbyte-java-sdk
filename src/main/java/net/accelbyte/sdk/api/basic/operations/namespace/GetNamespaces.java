/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.namespace;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getNamespaces
 *
 * <p>Get all namespaces. Other detail info:
 *
 * <p>* Required permission : resource= "ADMIN:NAMESPACE" , action=2 (READ) * Action code : 11303 *
 * Returns : list of namespaces
 */
@Getter
@Setter
public class GetNamespaces extends Operation {
  /** generated field's value */
  private String path = "/basic/v1/admin/namespaces";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private Boolean activeOnly;

  /** */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetNamespaces(Boolean activeOnly) {
    this.activeOnly = activeOnly;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "activeOnly",
        this.activeOnly == null ? null : Arrays.asList(String.valueOf(this.activeOnly)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public List<NamespaceInfo> parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<List<NamespaceInfo>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("activeOnly", "None");
    return result;
  }
}

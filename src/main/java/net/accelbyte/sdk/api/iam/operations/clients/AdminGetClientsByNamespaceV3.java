/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.clients;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminGetClientsByNamespaceV3
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:CLIENT [READ]'
 *
 * <p>action code: 10308
 */
@Getter
@Setter
public class AdminGetClientsByNamespaceV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/clients";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String clientId;
  private String clientName;
  private String clientType;
  private Integer limit;
  private Integer offset;

  /**
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGetClientsByNamespaceV3(
      String namespace,
      String clientId,
      String clientName,
      String clientType,
      Integer limit,
      Integer offset) {
    this.namespace = namespace;
    this.clientId = clientId;
    this.clientName = clientName;
    this.clientType = clientType;
    this.limit = limit;
    this.offset = offset;

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
    queryParams.put("clientId", this.clientId == null ? null : Arrays.asList(this.clientId));
    queryParams.put("clientName", this.clientName == null ? null : Arrays.asList(this.clientName));
    queryParams.put("clientType", this.clientType == null ? null : Arrays.asList(this.clientType));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ClientmodelClientsV3Response parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ClientmodelClientsV3Response().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("clientId", "None");
    result.put("clientName", "None");
    result.put("clientType", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    return result;
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.clients_deprecated;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * DeleteClientByNamespace
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:CLIENT:{clientId} [DELETE]' Endpoint
 * migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/admin/namespaces/{namespace}/clients/{clientId} [DELETE]
 *
 * <p>* Note:
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class DeleteClientByNamespace extends Operation {
  /** generated field's value */
  private String path = "/iam/namespaces/{namespace}/clients/{clientId}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String clientId;

  private String namespace;

  /**
   * @param clientId required
   * @param namespace required
   */
  @Builder
  public DeleteClientByNamespace(String clientId, String namespace) {
    this.clientId = clientId;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.clientId != null) {
      pathParams.put("clientId", this.clientId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.clientId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

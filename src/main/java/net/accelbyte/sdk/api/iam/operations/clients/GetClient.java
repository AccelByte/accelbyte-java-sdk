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
 * GetClient
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Required permission 'CLIENT [READ]' Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/admin/namespaces/{namespace}/clients/{clientId} [GET]
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class GetClient extends Operation {
  /** generated field's value */
  private String path = "/iam/clients/{clientId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String clientId;

  /**
   * @param clientId required
   */
  @Builder
  /*
   *  @deprecated 2022-08-29 All args constructor may cause problems. Use builder instead.
   */
  @Deprecated
  public GetClient(String clientId) {
    this.clientId = clientId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.clientId != null) {
      pathParams.put("clientId", this.clientId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.clientId == null) {
      return false;
    }
    return true;
  }

  public ClientmodelClientResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ClientmodelClientResponse().createFromJson(json);
  }
}

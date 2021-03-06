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
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * CreateClient
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Required permission 'CLIENT:ADMIN [CREATE]'. Endpoint migration guide
 *
 * <p>* Substitute endpoint: /iam/v3/admin/namespaces/{namespace}/clients [POST]
 *
 * <p>* Note:
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class CreateClient extends Operation {
  /** generated field's value */
  private String path = "/iam/clients";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private ClientmodelClientCreateRequest body;

  /**
   * @param body required
   */
  @Builder
  public CreateClient(ClientmodelClientCreateRequest body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public ClientmodelClientCreateRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public ClientmodelClientCreationResponse parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 201) {
      return new ClientmodelClientCreationResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}

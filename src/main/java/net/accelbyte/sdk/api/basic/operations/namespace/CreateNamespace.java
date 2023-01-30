/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.namespace;

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
 * createNamespace
 *
 * <p>Create a namespace. By default the namespace is enabled. In multi tenant mode, parentNamespace
 * will be automatically filled with requester namespace if the requester is using studio or
 * publisher token, and it will be filled with studio namespace if the requester uses game token. An
 * oauth client will also be created and the id will be returned. Other detail info:
 *
 * <p>* Required permission : resource= "ADMIN:NAMESPACE" , action=1 (CREATE) * Action code : 11301
 * * Returns : created namespace
 */
@Getter
@Setter
public class CreateNamespace extends Operation {
  /** generated field's value */
  private String path = "/basic/v1/admin/namespaces";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private NamespaceCreate body;

  /** */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateNamespace(NamespaceCreate body) {
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public NamespaceCreate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public NamespaceInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new NamespaceInfo().createFromJson(json);
  }
}

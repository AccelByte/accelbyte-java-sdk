/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

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
 * GetUserMapping
 *
 * <p>This endpoint requires the client access token as the bearer token. Required permission
 * 'ADMIN:NAMESPACE:{namespace}:JUSTICE:USER:{userId} [READ]'
 *
 * <p>This endpoint will support publisher access to game and game access to publisher
 *
 * <p>If targetNamespace filled with publisher namespace then this endpoint will return its game
 * user id and game namespace
 *
 * <p>If targetNamespace filled with game namespace then this endpoint will return its publisher
 * user id and publisher namespace
 */
@Getter
@Setter
public class GetUserMapping extends Operation {
  /** generated field's value */
  private String path =
      "/iam/namespaces/{namespace}/users/{userId}/platforms/justice/{targetNamespace}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String targetNamespace;
  private String userId;

  /**
   * @param namespace required
   * @param targetNamespace required
   * @param userId required
   */
  @Builder
  public GetUserMapping(String namespace, String targetNamespace, String userId) {
    this.namespace = namespace;
    this.targetNamespace = targetNamespace;
    this.userId = userId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.targetNamespace != null) {
      pathParams.put("targetNamespace", this.targetNamespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.targetNamespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public ModelGetUserMapping parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelGetUserMapping().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}

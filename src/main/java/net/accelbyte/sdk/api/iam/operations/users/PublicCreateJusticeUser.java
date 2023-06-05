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
 * PublicCreateJusticeUser
 *
 * <p>Create Justice User from Publisher User information. It will check first if Justice User on
 * target namespace already exist.
 */
@Getter
@Setter
public class PublicCreateJusticeUser extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v3/public/namespaces/{namespace}/users/me/platforms/justice/{targetNamespace}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String targetNamespace;

  /**
   * @param namespace required
   * @param targetNamespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicCreateJusticeUser(String namespace, String targetNamespace) {
    this.namespace = namespace;
    this.targetNamespace = targetNamespace;

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
    return true;
  }

  public ModelCreateJusticeUserResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelCreateJusticeUserResponse().createFromJson(json);
  }
}

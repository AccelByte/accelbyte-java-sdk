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
 * GetUserJusticePlatformAccount
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint:
 * /iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms/justice/{targetNamespace} [GET]
 *
 * <p>This endpoint requires the client access token as the bearer token. Required permission
 * 'ADMIN:NAMESPACE:{namespace}:JUSTICE:USER:{userId} [UPDATE]'
 *
 * <p>The endpoint returns user Justice platform account linked with the given user. If the user
 * Justice platform account doesn't exist in the designated namespace, the endpoint is going toÂ
 * create and return the new Justice platform account. The newly user Justice platform account is
 * going to be forced to perform token grant through the given user and can't perform password
 * update
 *
 * <p>### Read Justice Platform Account UserID
 *
 * <p>In order to read the Justice platform account UserID, it is required to have the permission:
 * NAMESPACE:{namespace}:JUSTICE:USER:{userId} [READ] , otherwise the UserID is going to be censored
 * and replaced with âRedactedâ text.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class GetUserJusticePlatformAccount extends Operation {
  /** generated field's value */
  private String path =
      "/iam/namespaces/{namespace}/users/{userId}/platforms/justice/{targetNamespace}";

  private String method = "POST";
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
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetUserJusticePlatformAccount(String namespace, String targetNamespace, String userId) {
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

  public ModelGetUserJusticePlatformAccountResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelGetUserJusticePlatformAccountResponse().createFromJson(json);
  }
}

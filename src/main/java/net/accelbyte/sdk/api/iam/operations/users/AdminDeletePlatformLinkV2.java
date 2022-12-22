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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminDeletePlatformLinkV2
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>Endpoint migration guide
 *
 * <p>* Substitute endpoint:
 * /iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId} [DELETE]
 *
 * <p>Required permission 'ADMIN:NAMESPACE:{namespace}:USER:{userId} [DELETE]'.
 *
 * <p>## Supported platforms:
 *
 * <p>* steam
 *
 * <p>* steamopenid
 *
 * <p>* facebook
 *
 * <p>* google
 *
 * <p>* oculus
 *
 * <p>* twitch
 *
 * <p>* android
 *
 * <p>* ios
 *
 * <p>* device
 *
 * <p>* discord
 *
 * <p>Delete link of user's account with platform. 'justice' platform might have multiple accounts
 * from different namespaces linked. platform_namespace need to be specified when the platform ID is
 * 'justice'.
 *
 * <p>Delete link of justice platform will enable password token grant and password update.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class AdminDeletePlatformLinkV2 extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v2/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId}/link";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded", "text/plain");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private String userId;
  private String platformNamespace;

  /**
   * @param namespace required
   * @param platformId required
   * @param userId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminDeletePlatformLinkV2(
      String namespace, String platformId, String userId, String platformNamespace) {
    this.namespace = namespace;
    this.platformId = platformId;
    this.userId = userId;
    this.platformNamespace = platformNamespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.platformId != null) {
      pathParams.put("platformId", this.platformId);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.platformNamespace != null) {
      formDataParams.put("platform_namespace", this.platformNamespace);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platformId == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

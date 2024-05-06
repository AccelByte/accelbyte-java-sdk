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
 * AdminDeleteUserLinkingHistoryByPlatformIDV3
 *
 * <p>This API is for admin to delete user's linking history with target platform id. Supported
 * platform: - Steam group(steamnetwork) - steam - steamopenid - PSN group(psn) - ps4web - ps4 - ps5
 * - XBOX group(xbox) - live - xblweb - Oculus group(oculusgroup) - oculus - oculusweb - facebook -
 * google - twitch - discord - apple - epicgames - nintendo - awscognito - netflix - snapchat - oidc
 * platform id
 *
 * <p>Note: you can use either platform ID or platform group as platformId query parameter
 */
@Getter
@Setter
public class AdminDeleteUserLinkingHistoryByPlatformIDV3 extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId}/link/histories";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private String userId;

  /**
   * @param namespace required
   * @param platformId required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminDeleteUserLinkingHistoryByPlatformIDV3(
      String namespace, String platformId, String userId) {
    this.namespace = namespace;
    this.platformId = platformId;
    this.userId = userId;

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

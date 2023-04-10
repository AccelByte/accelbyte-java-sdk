/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

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
 * AdminRetrieveUserThirdPartyPlatformTokenV3
 *
 * <p>Admin Retrieve User Third Party Platform Token
 *
 * <p>This endpoint used for retrieving third party platform token for user that login using third
 * party, if user have not link requested platform in game namespace, will try to retrieving third
 * party platform token from publisher namespace. Passing platform group name or it's member will
 * return same access token that can be used across the platform members.
 *
 * <p>Notes:
 *
 * <p>* Required permission: ADMIN:NAMESPACE:{namespace}:USER:{userId} [READ]
 *
 * <p>The third party platform and platform group covered for this is:
 *
 * <p>* (psn) ps4web
 *
 * <p>* (psn) ps4
 *
 * <p>* (psn) ps5
 *
 * <p>* xbox live
 *
 * <p>* steam
 */
@Getter
@Setter
public class AdminRetrieveUserThirdPartyPlatformTokenV3 extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v3/oauth/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId}/platformToken";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
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
  public AdminRetrieveUserThirdPartyPlatformTokenV3(
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

  public OauthmodelTokenThirdPartyResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthmodelTokenThirdPartyResponse().createFromJson(json);
  }
}

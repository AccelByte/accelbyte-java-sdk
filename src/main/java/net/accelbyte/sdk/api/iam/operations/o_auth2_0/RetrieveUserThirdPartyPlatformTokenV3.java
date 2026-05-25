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
 * RetrieveUserThirdPartyPlatformTokenV3
 *
 * <p>Retrieve User Third Party Platform Token Retrieves third party platform token for users that
 * logged in using a third party platform. If the user has not linked the requested platform in the
 * game namespace, attempts to retrieve the token from the publisher namespace. Passing platform
 * group name or it's member will return same access token that can be used across the platform
 * members.
 *
 * <p>The third party platform and platform group covered for this is: - (psn) ps4web - (psn) ps4 -
 * (psn) ps5 - epicgames - twitch - awscognito - - eaorigin - snapchat - twitch - live
 *
 * <p>**Authentication:** The _**userId**_ parameter should match the one in the access token.
 */
@Getter
@Setter
public class RetrieveUserThirdPartyPlatformTokenV3 extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v3/oauth/namespaces/{namespace}/users/{userId}/platforms/{platformId}/platformToken";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("*/*");
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
  public RetrieveUserThirdPartyPlatformTokenV3(String namespace, String platformId, String userId) {
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

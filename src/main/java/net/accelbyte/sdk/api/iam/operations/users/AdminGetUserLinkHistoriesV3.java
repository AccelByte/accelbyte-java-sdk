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
 * AdminGetUserLinkHistoriesV3
 *
 * <p>This API is for admin to get user's link history.
 *
 * <p>**Supported Platforms:** - Steam group (steamnetwork): - steam - steamopenid - PSN group
 * (psn): - ps4web - ps4 - ps5 - XBOX group(xbox): - live - xblweb - Oculus group (oculusgroup): -
 * oculus - oculusweb - Google group (google): - google - googleplaygames: - epicgames - facebook -
 * twitch - discord - android - ios - apple - device - nintendo - awscognito - amazon - netflix -
 * snapchat - _oidc platform id_
 *
 * <p>Note: - You can use either platform id or platform group as **platformId** parameter. -
 * **Nintendo platform user id**: NSA ID need to be appended with Environment ID using colon as
 * separator. e.g kmzwa8awaa:dd1
 */
@Getter
@Setter
public class AdminGetUserLinkHistoriesV3 extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms/link/histories";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String platformId;

  /**
   * @param namespace required
   * @param userId required
   * @param platformId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGetUserLinkHistoriesV3(String namespace, String userId, String platformId) {
    this.namespace = namespace;
    this.userId = userId;
    this.platformId = platformId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("platformId", this.platformId == null ? null : Arrays.asList(this.platformId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.platformId == null) {
      return false;
    }
    return true;
  }

  public ModelUserPlatformLinkHistories parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelUserPlatformLinkHistories().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("platformId", "None");
    return result;
  }
}

/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

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
 * PublicGetUserByPlatformUserIDV4
 *
 * <p>Get User By Platform User ID. This endpoint return user information by given platform ID and
 * platform user ID. Several platforms are grouped under account groups, you can use either platform
 * ID or platform group as platformId path parameter. example: for steam network platform, you can
 * use steamnetwork / steam / steamopenid as platformId path parameter. If the target platform is
 * not linked to the current user, will only return public information. ----------
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
public class PublicGetUserByPlatformUserIDV4 extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v4/public/namespaces/{namespace}/platforms/{platformId}/users/{platformUserId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private String platformUserId;

  /**
   * @param namespace required
   * @param platformId required
   * @param platformUserId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetUserByPlatformUserIDV4(
      String namespace, String platformId, String platformUserId) {
    this.namespace = namespace;
    this.platformId = platformId;
    this.platformUserId = platformUserId;

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
    if (this.platformUserId != null) {
      pathParams.put("platformUserId", this.platformUserId);
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
    if (this.platformUserId == null) {
      return false;
    }
    return true;
  }

  public ModelUserResponseV3 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelUserResponseV3().createFromJson(json);
  }
}

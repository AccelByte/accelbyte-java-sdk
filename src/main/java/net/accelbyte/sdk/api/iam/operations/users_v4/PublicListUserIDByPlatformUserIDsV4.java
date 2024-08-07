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
 * PublicListUserIDByPlatformUserIDsV4
 *
 * <p>List User ID By Platform User ID This endpoint intended to list game user ID from the given
 * namespace This endpoint return list of user ID by given platform ID and list of platform user ID,
 * the max count is 100.
 *
 * <p>Supported platform: - steam - steamopenid - ps4web - ps4 - ps5 - live - xblweb - oculus -
 * oculusweb - facebook - google - googleplaygames - twitch - discord - apple - device - justice -
 * epicgames - nintendo - awscognito - netflix - snapchat - oidc platform id
 *
 * <p>Note: **nintendo platform user ID**: NSA ID need to be appended with Environment ID using
 * colon as separator. e.g kmzwa8awaa:dd1
 *
 * <p>If the request body exceed the max limitation, the max count will be in response body's
 * messageVariables: "messageVariables": {"maxCount": "100"}
 */
@Getter
@Setter
public class PublicListUserIDByPlatformUserIDsV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/public/namespaces/{namespace}/platforms/{platformId}/users";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private Boolean rawPUID;
  private ModelPlatformUserIDRequestV4 body;

  /**
   * @param namespace required
   * @param platformId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicListUserIDByPlatformUserIDsV4(
      String namespace, String platformId, Boolean rawPUID, ModelPlatformUserIDRequestV4 body) {
    this.namespace = namespace;
    this.platformId = platformId;
    this.rawPUID = rawPUID;
    this.body = body;

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
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "rawPUID", this.rawPUID == null ? null : Arrays.asList(String.valueOf(this.rawPUID)));
    return queryParams;
  }

  @Override
  public ModelPlatformUserIDRequestV4 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.platformId == null) {
      return false;
    }
    return true;
  }

  public AccountcommonUserPlatforms parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new AccountcommonUserPlatforms().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("rawPUID", "None");
    return result;
  }
}

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
 * PublicPlatformUnlinkV3
 *
 * <p>Required valid user authorization.
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
 * <p>* apple
 *
 * <p>* device
 *
 * <p>* discord
 *
 * <p>* awscognito
 *
 * <p>* epicgames
 *
 * <p>* nintendo
 *
 * <p>Unlink user's account from a specific platform. 'justice' platform might have multiple
 * accounts from different namespaces linked.
 *
 * <p>platformNamespace need to be specified when the platform ID is 'justice'.
 *
 * <p>Unlink user's account from justice platform will enable password token grant and password
 * update.
 *
 * <p>If you want to unlink user's account in a game namespace, you have to specify
 * platformNamespace to that game namespace.
 *
 * <p>action code : 10121
 */
@Getter
@Setter
public class PublicPlatformUnlinkV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/namespaces/{namespace}/users/me/platforms/{platformId}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private ModelUnlinkUserPlatformRequest body;

  /**
   * @param namespace required
   * @param platformId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicPlatformUnlinkV3(
      String namespace, String platformId, ModelUnlinkUserPlatformRequest body) {
    this.namespace = namespace;
    this.platformId = platformId;
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
  public ModelUnlinkUserPlatformRequest getBodyParams() {
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

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}

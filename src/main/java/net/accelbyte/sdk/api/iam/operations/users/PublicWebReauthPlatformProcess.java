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
 * PublicWebReauthPlatformProcess
 *
 * <p>Completes the re-auth flow on the IAM side and returns the result directly instead of
 * redirecting to the **redirectUri** defined when calling the `GET
 * /users/me/platforms/{platformId}/web/reauth` endpoint.
 *
 * <p>The re-auth flow inside IAM depends on the **operation** parameter passed to `GET
 * /users/me/platforms/{platformId}/web/reauth` endpoint. For **operation=GDPR**, the **gdpr_token**
 * cookie is set in the response headers on success.
 *
 * <p>Supported platforms: - ps4web - xblweb - steamopenid - epicgames - facebook - twitch - google
 * - apple - snapchat - discord - amazon - oculusweb
 */
@Getter
@Setter
public class PublicWebReauthPlatformProcess extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v3/public/namespaces/{namespace}/users/me/platforms/{platformId}/web/reauth/process";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private String code;
  private String state;

  /**
   * @param namespace required
   * @param platformId required
   * @param state required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicWebReauthPlatformProcess(
      String namespace, String platformId, String code, String state) {
    this.namespace = namespace;
    this.platformId = platformId;
    this.code = code;
    this.state = state;

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
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.code != null) {
      formDataParams.put("code", this.code);
    }
    if (this.state != null) {
      formDataParams.put("state", this.state);
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
    if (this.state == null) {
      return false;
    }
    return true;
  }

  public ModelWebReauthProcessResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelWebReauthProcessResponse().createFromJson(json);
  }
}

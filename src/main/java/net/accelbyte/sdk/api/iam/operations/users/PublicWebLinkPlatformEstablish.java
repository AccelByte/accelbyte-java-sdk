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
 * PublicWebLinkPlatformEstablish
 *
 * <p>Callback endpoint for the third party to redirect to after authentication to complete the
 * linking process for the IAM account. After successfully perform the account linking, it will
 * redirect to the **redirectUri** defined when calling the `GET
 * /users/me/platforms/{platformId}/web/link` endpoint.
 *
 * <p>Supported platforms: - ps4web - xblweb - steamopenid - epicgames - facebook - twitch - google
 * - apple - snapchat - discord - amazon - oculusweb
 *
 * <p>## New API version
 *
 * <p>This API remains fully functional, but `GET
 * /users/me/platforms/{platformId}/web/reauth/establish` is recommended for new integrations.
 */
@Getter
@Setter
public class PublicWebLinkPlatformEstablish extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v3/public/namespaces/{namespace}/users/me/platforms/{platformId}/web/link/establish";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = "PLACEHOLDER";

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
  public PublicWebLinkPlatformEstablish(
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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("code", this.code == null ? null : Arrays.asList(this.code));
    queryParams.put("state", this.state == null ? null : Arrays.asList(this.state));
    return queryParams;
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

  public String parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final String json = Helper.convertInputStreamToString(payload);
    if (code != 302) {
      throw new HttpResponseException(code, json);
    }
    return json;
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("code", "None");
    result.put("state", "None");
    return result;
  }
}

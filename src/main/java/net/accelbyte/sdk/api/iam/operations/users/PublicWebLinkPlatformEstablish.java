/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicWebLinkPlatformEstablish
 *
 * <p>This endpoint is used by third party to redirect the code for the purpose of linking the
 * account third party to IAM account.
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
  @Deprecated private String security = "Bearer";
  private String locationQuery = "PLACEHOLDER";
  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private String state;

  /**
   * @param namespace required
   * @param platformId required
   * @param state required
   */
  @Builder
  public PublicWebLinkPlatformEstablish(String namespace, String platformId, String state) {
    this.namespace = namespace;
    this.platformId = platformId;
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

  public String parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code != 302) {
      throw new HttpResponseException(code, json);
    }
    return json;
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("state", "None");
    return result;
  }
}

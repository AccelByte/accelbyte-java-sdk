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
 * PublicWebReauthPlatform
 *
 * <p>Generates a redirect to a third party login page for re-authentication purpose.
 *
 * <p>Supported platforms: - ps4web - xblweb - steamopenid - epicgames - facebook - twitch - google
 * - apple - snapchat - discord - amazon - oculusweb
 */
@Getter
@Setter
public class PublicWebReauthPlatform extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v3/public/namespaces/{namespace}/users/me/platforms/{platformId}/web/reauth";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platformId;
  private String clientId;
  private String redirectUri;
  private String operation;

  /**
   * @param namespace required
   * @param platformId required
   * @param operation required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicWebReauthPlatform(
      String namespace, String platformId, String clientId, String redirectUri, String operation) {
    this.namespace = namespace;
    this.platformId = platformId;
    this.clientId = clientId;
    this.redirectUri = redirectUri;
    this.operation = operation;

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
    queryParams.put("clientId", this.clientId == null ? null : Arrays.asList(this.clientId));
    queryParams.put(
        "redirectUri", this.redirectUri == null ? null : Arrays.asList(this.redirectUri));
    queryParams.put("operation", this.operation == null ? null : Arrays.asList(this.operation));
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
    if (this.operation == null) {
      return false;
    }
    return true;
  }

  public ModelWebLinkingResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelWebLinkingResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("clientId", "None");
    result.put("redirectUri", "None");
    result.put("operation", "None");
    return result;
  }

  public enum Operation {
    GDPR("GDPR"),
    LINK("LINK");

    private String value;

    Operation(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PublicWebReauthPlatformBuilder {
    private String operation;

    public PublicWebReauthPlatformBuilder operation(final String operation) {
      this.operation = operation;
      return this;
    }

    public PublicWebReauthPlatformBuilder operationFromEnum(final Operation operation) {
      this.operation = operation.toString();
      return this;
    }
  }
}

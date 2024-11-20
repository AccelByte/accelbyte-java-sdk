/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.platform_credential;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminDeletePlatformCredentialsByPlatformId
 *
 * <p>Delete platform credentials for specific platform used for Native Session sync. Supported
 * platforms: XBOX, PSN
 */
@Getter
@Setter
public class AdminDeletePlatformCredentialsByPlatformId extends Operation {
  /** generated field's value */
  private String path =
      "/session/v1/admin/namespaces/{namespace}/platform-credentials/{platformId}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platformId;

  /**
   * @param namespace required
   * @param platformId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminDeletePlatformCredentialsByPlatformId(String namespace, String platformId) {
    this.namespace = namespace;
    this.platformId = platformId;

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

  public enum PlatformId {
    PSN("PSN"),
    XBOX("XBOX");

    private String value;

    PlatformId(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AdminDeletePlatformCredentialsByPlatformIdBuilder {
    private String platformId;

    public AdminDeletePlatformCredentialsByPlatformIdBuilder platformId(final String platformId) {
      this.platformId = platformId;
      return this;
    }

    public AdminDeletePlatformCredentialsByPlatformIdBuilder platformIdFromEnum(
        final PlatformId platformId) {
      this.platformId = platformId.toString();
      return this;
    }
  }
}
